# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'imdbapi/version'

Gem::Specification.new do |spec|
  spec.name          = "imdbapi"
  spec.version       = Imdbapi::VERSION
  spec.authors       = ["Mark Tareshawty"]
  spec.email         = ["tarebyte@gmail.com"]
  spec.description   = %q{Ruby wrapper for IMDbApi.org}
  spec.summary       = %q{Get all of the awesome movie data you want from IMDB faster than web scraping.}
  spec.homepage      = "http://tarebyte.github.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
