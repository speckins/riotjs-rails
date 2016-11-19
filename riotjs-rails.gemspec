# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "riotjs-rails/version"

Gem::Specification.new do |s|
  s.name        = "riotjs-rails"
  s.version     = Riot::Rails::VERSION
  s.authors     = ["Adam Butler"]
  s.email       = ["adam@lab.io"]
  s.homepage    = "https://github.com/adambutler/riotjs-rails"
  s.summary     = %q{riot.js asset pipeline provider/wrapper}
  s.description = "A simple asset-pipeline wrapper for Riot.js by muut"
  s.license     = "MIT"

  s.rubyforge_project = "riotjs-rails"

  s.files         = %w{Gemfile LICENSE.md Readme.md Rakefile}
  s.files        += Dir['lib/riotjs-rails.rb', 'lib/riotjs-rails/**/*']
  s.files        += Dir['lib/support/**/*']
  s.files        += Dir['vendor/**/*']
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'tilt', '>= 1.1'
  s.add_dependency 'execjs'
  s.add_dependency 'sprockets'
  s.add_dependency 'actionview'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec'
end
