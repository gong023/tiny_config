require "tiny_config/version"
require 'singleton'

class TinyConfig
  def self.register(namespace, config_keys)
    const_set namespace.capitalize, Class.new {
      include ::Singleton

      config_keys = [config_keys] unless config_keys.instance_of?(Array)

      config_keys.each do |config_key|
        attr_writer config_key

        define_method config_key do
          v = instance_variable_get("@#{config_key}")
          v.nil? ? raise(TinyConfig::ConfigKeyNillError, message) : v
        end
      end

      def message
        namespace = self.class.to_s.split('::').last.downcase
        required_key = caller()[1].match(/`.*'?/).to_s.delete('`\'')
        "#{namespace} #{required_key} is requried."
      end
    }
  end

  def self.method_missing namespace
    raise UndefinedNamespaceError, namespace unless self.constants.include? namespace.capitalize
    const_get(namespace.capitalize).instance
  end

  class ConfigKeyNillError < StandardError; end
  class UndefinedNamespaceError < StandardError; end
end
