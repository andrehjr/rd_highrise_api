# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rd_highrise_api/version'

Gem::Specification.new do |spec|
  spec.name          = "rd_highrise_api"
  spec.version       = RdHighriseApi::VERSION
  spec.authors       = ["André Luis Leal Cardoso Junior"]
  spec.email         = ["andrehjr@gmail.com"]
  spec.summary       = %q{Access highrise api using Faraday}
  spec.description   = %q{Simple gem that allows to access Highrise api}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop", "~> 0.18.1"
  spec.add_development_dependency "ruby-lint", "~> 1.1.0"
  spec.add_development_dependency "rspec", "~> 2.14"
end
