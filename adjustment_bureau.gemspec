# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'adjustment_bureau/version'

Gem::Specification.new do |spec|
  spec.name          = "adjustment_bureau"
  spec.version       = AdjustmentBureau::VERSION
  spec.authors       = ["bjh"]
  spec.email         = ["fake@fake.com"]
  spec.summary       = %q{A CSS property adjuster}
  spec.description   = %q{Something I needed at work so I gemmed it up...}
  spec.homepage      = "https://github.com/bjh/adjustment_bureau"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
end
