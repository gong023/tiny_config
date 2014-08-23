require "tiny_config/version"

class TinyConfig
  def self.register(namespace, config_keys)
    config_keys.each do |config_key|
      const_set namespace.capitalize, Class.new {
#        class << self
#          attr_writer config_key
#        end

        define_singleton_method config_key do
        end
      }
    end
  end

  def self.method_missing namespace
    const_get(namespace.to_s.capitalize)
  end
end

TinyConfig.register(:twitter, [:access_key])
TinyConfig.twitter.access_key = 'hi'
TinyConfig.twitter.access_key
