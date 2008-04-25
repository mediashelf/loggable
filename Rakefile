require 'rubygems'
require 'rake/gempackagetask'
require 'rake/testtask'

require 'lib/version'

GEM = "loggable"
AUTHOR = "Patrick Reagan"
EMAIL = "patrick.reagan@viget.com"
HOMEPAGE = "http://viget.rubyforge.org/loggable"
SUMMARY = "A gem that provides logging capabilities to any class"

task :default => :test

spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = Loggable::VERSION::STRING
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.rubyforge_project = 'viget'
  
  s.require_path = 'lib'
  s.files = %w(LICENSE README HISTORY Rakefile) + Dir.glob("{lib,test}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM}-#{VERSION}}
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = FileList['test/examples/*_test.rb']
  t.verbose = true
end