# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'locus/version'

Gem::Specification.new do |gem|
  gem.name          = 'locus'
  gem.version       = Locus::VERSION
  gem.authors       = ['Gebhard Wöstemeyer']
  gem.email         = ['g.woestemeyer@gmail.com']
  gem.description   = 'The gem uses the downloadable geonames.org database for retrieving additional information about postal codes'
  gem.summary       = 'Information about postal codes'
  gem.homepage      = 'https://github.com/gewo/locus/'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'activesupport'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'coveralls'
end
