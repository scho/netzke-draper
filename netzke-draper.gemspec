
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "netzke/draper/version"

Gem::Specification.new do |s|
  s.name        = "netzke-draper"
  s.version     = Netzke::Draper::Version::STRING
  s.platform    = Gem::Platform::RUBY
  s.author      = "Georg Meyer"
  s.email       = "georgmeyer83@googlemail.com"
  s.homepage    = "http://github.com/scho/netzke-draper"
  s.summary     = "Enables draper decorators in Netzke components"
  s.description = "Gives you the ability to use any decorator in netzke components with almost no effort"

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {spec}/*`.split("\n")
  s.require_path = ["lib"]

  s.add_development_dependency 'rspec', '~> 2.6.0'
  s.add_development_dependency 'rake', '~> 0.9'
  s.add_development_dependency 'rails', '~> 3.2.8'
  s.add_development_dependency 'rspec-rails', '~> 2.6.1'

  s.add_runtime_dependency 'draper'
  s.add_runtime_dependency 'netzke-basepack'

  s.required_rubygems_version = ">= 1.3.4"
end
