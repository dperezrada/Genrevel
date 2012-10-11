# -*- encoding: utf-8 -*-
require File.expand_path('../lib/genrevel/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Daniel Pérez Rada"]
  gem.email         = ["dperezrada@gmail.com"]
  gem.description   = "A revel.js generator"
  gem.summary       = "A revel.js generator"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "genrevel"
  gem.require_paths = ["lib"]
  gem.version       = Genrevel::VERSION
  gem.executables << 'genrevel'

  gem.add_dependency('thor')
  gem.add_development_dependency('rspec', [">= 2.0.0"])
end
