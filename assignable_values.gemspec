$:.push File.expand_path("../lib", __FILE__)
require "angular_xss/version"

Gem::Specification.new do |s|
  s.name = 'angular_xss'
  s.version = AngularXss::VERSION
  s.authors = ["Henning Koch"]
  s.email = 'henning.koch@makandra.de'
  s.homepage = 'https://github.com/makandra/angular_xss'
  s.summary = 'Patches rails_xss and Haml so AngularJS interpolations are auto-escaped in unsafe strings.'
  s.description = s.summary
  s.license = 'MIT'

  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{^spec/})
  s.require_paths = ["lib"]

  s.add_dependency('activesupport')
  s.add_dependency('haml')
end
