# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skatteverket/version'

Gem::Specification.new do |spec|
  spec.name          = "skatteverket"
  spec.version       = Skatteverket::VERSION
  spec.authors       = ["Peter Hellberg"]
  spec.email         = ["peter@c7.se"]
  spec.summary       = "A library for extracting PSI-data published by Skatteverket."
  spec.homepage      = "https://github.com/peterhellberg/skatteverket"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 1.9.3'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.6"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
end
