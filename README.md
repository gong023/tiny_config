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
TinyConfig.register(:twitter, [:access_token, :access_secret]);
TinyConfig.twitter.access_token = 'abcd'
TinyConfig.twitter.access_token
=> 'abcd'
TinyConfig.twitter.access_secret
=> Throws Exception
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
