# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tiny_config/version'

Gem::Specification.new do |spec|
  spec.name          = "tiny_config"
  spec.version       = TinyConfig::VERSION
  spec.authors       = ["gong023"]
  spec.email         = ["gon.gong.gone@gmail.com"]
  spec.description   = %q{simple and tiny config class for casual use}
  spec.summary       = %q{simple and tiny config class}
  spec.homepage      = "https://github.com/gong023/tiny_config"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
