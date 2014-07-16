# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'loggable/version'

Gem::Specification.new do |s|
  s.name = %q{mediashelf-loggable}
  s.version = Loggable::VERSION
  s.authors = ["Patrick Reagan", "Matt Zumwalt"]
  s.email = %q{matt.zumwalt@yourmediashelf.com}
  s.homepage = %q{http://github.com/mediashelf/loggable}
  s.summary = %q{A gem that provides logging capabilities to any class}
  s.description = %q{A gem that provides logging capabilities to any class.  Relies on Rails logger if it's available.  Extended from loggable gem by viget}
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test}/*`.split("\n")
  # s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.required_rubygems_version = ">= 1.3.6"


  s.add_development_dependency "rake"
  s.add_development_dependency 'yard'
  s.add_development_dependency 'RedCloth'
  s.add_development_dependency 'test-unit'
  s.add_development_dependency 'minitest', '~> 4.0'
  s.add_development_dependency 'mocha', '~> 1.0'
  s.add_development_dependency 'thoughtbot-shoulda'
  
end
