# TinyConfig

simple and tiny config class.

## Installation

Add this line to your application's Gemfile:

    gem 'tiny_config'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tiny_config

## Usage

```ruby
config = TinyConfig.register(:twitter, [:access_token, :access_secret]);
expect(config).to be TinyConfig::Twitter
expect(TinyConfig.twitter).to be_instance_of TinyConfig::Twitter

TinyConfig.twitter.access_token = 'abcd'
expect(TinyConfig.twitter.access_token).to eq 'abcd'
expect { TinyConfig.twitter.access_secret }.to raise_error TinyConfig::ConfigKeyNillError

expect { TinyConfig.unregistered.key }.to raise_error TinyConfig::UndefinedNamespaceError

TinyConfig.clear!
expect { TinyConfig.twitter.access_token }.to raise_error TinyConfig::UndefinedNamespaceError
expect { TinyConfig.twitter.access_secret }.to raise_error TinyConfig::UndefinedNamespaceError
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
