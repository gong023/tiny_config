$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'tiny_config'
require 'readme_spec'

RSpec.configure do |c|
  c.readme_file_path = File.dirname(__FILE__) + '/../README.md'
end
