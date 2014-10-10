# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'edmunds/version'

Gem::Specification.new do |spec|
  spec.name          = "edmunds"
  spec.version       = Edmunds::VERSION
  spec.authors       = ["Benjamin Cavileer"]
  spec.email         = ["bcavileer@holmanauto.com"]
  spec.summary       = %q{Ruby wrapper for the Edmunds Vehicle API (V2)}
  spec.description   = %q{This API wrapper will allow you to make calls to the Edmunds APIs}
  spec.homepage      = ""
  spec.license       = "MIT"

  files = `git ls-files -z`.split("\x0")
  spec.files         = spec.files.grep(%r{^lib/}) { |f| File.basename(f) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rest-client", "~> 1.6"
  spec.add_runtime_dependency "multi_json", "~> 1.10"
  spec.add_runtime_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "oj", "~> 2.10"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

end
