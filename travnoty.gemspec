# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'travnoty/version'

Gem::Specification.new do |gem|
  gem.name          = "travnoty"
  gem.version       = Travnoty::Version
  gem.authors       = ["João Soares"]
  gem.email         = ["jsoaresgeral@gmail.com"]
  gem.description   = %q{A ruby interface to the Travnoty API.}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/jasoares/travnoty_client"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'faraday', '~> 0.8.5'
  gem.add_dependency 'multi_json', '~> 1.6.1'
  gem.add_development_dependency 'bundler', '~> 1.2.4'
end
