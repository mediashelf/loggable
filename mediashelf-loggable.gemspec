# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'loggable/version'

Gem::Specification.new do |s|
  s.name = %q{mediashelf-loggable}
  s.version = Loggable.version
  s.authors = ["Patrick Reagan", "Matt Zumwalt"]
  s.email = %q{matt.zumwalt@yourmediashelf.com}
  s.homepage = %q{http://github.com/mediashelf/mediashelf-loggable}
  s.summary = %q{A gem that provides logging capabilities to any class}
  s.description = %q{A gem that provides logging capabilities to any class.  Relies on Rails logger if it's available.  Extended from loggable gem by viget}
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  # s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.required_rubygems_version = ">= 1.3.6"


  s.add_development_dependency "rspec", "< 2.0" # We're not ready to upgrade to rspec 2
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'rcov'
  s.add_development_dependency 'thoughtbot-shoulda'
  s.add_development_dependency 'jnunemaker-matchy'
  s.add_development_dependency 'yard', '0.6.5'  # Yard > 0.6.5 won't generate docs.
  s.add_development_dependency 'RedCloth'
end
