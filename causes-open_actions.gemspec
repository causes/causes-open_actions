# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'open_actions/version'

Gem::Specification.new do |spec|
  spec.name          = "causes-open_actions"
  spec.version       = OpenActions::VERSION
  spec.authors       = ["Jeremy Dunck", "Joe Lencioni", "Ryan Fitzgerald"]
  spec.email         = ["jeremy@causes.com"]
  spec.description   = \
  spec.summary       = %q{Open-source actions for the Causes.com platform}
  spec.homepage      = "https://github.com/causes/causes-open_actions"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
