#require "tiny_config/version"
require 'singleton'

class TinyConfig
  def self.register(namespace, config_keys)
    const_set namespace.capitalize, Class.new {
      include ::Singleton

      config_keys.each do |config_key|
        attr_writer config_key

        define_method config_key do
          v = instance_variable_get("@#{config_key}")
          v.nil? ? raise(TinyConfig::ConfigKeyNillError, message) : v
        end
      end

      def message
        service_name = self.class.to_s.split('::').last.downcase
        required_key = caller()[1].match(/`.*'?/).to_s.delete('`\'')
        "#{service_name} #{required_key} is requried."
      end
    }
  end

  def self.method_missing namespace
    const_get(namespace.capitalize).instance
  end

  class ConfigKeyNillError < StandardError; end
end

#TinyConfig.register(:twitter, [:access_key, :access_sec])
#TinyConfig.twitter.access_key = 'hi'
#puts TinyConfig.twitter.access_key
#begin
#  TinyConfig.twitter.access_sec
#rescue TinyConfig::ConfigKeyNillError
#  puts 'hi'
#end
