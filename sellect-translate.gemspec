# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sellect/translate/version'

Gem::Specification.new do |s|
  s.name          = "sellect-translate"
  s.version       = Sellect::Translate::VERSION
  s.authors       = ["Alisa Chang"]
  s.email         = ["alisa@sellect.com"]
  s.summary       = "Rails I18n library for ActiveRecord Model translations"
  s.description   = "Rails I18n library for ActiveRecord Model translations"
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.6"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "protected_attributes"
end
