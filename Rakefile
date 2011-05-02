require 'rubygems'
require 'rake/gempackagetask'
require 'rake/testtask'

# adding tasks defined in lib/tasks
Dir.glob('lib/tasks/*.rake').each { |r| import r }

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "mediashelf-loggable"
    gem.summary = %Q{A gem that provides logging capabilities to any class}
    gem.description = %Q{A gem that provides logging capabilities to any class.  Relies on Rails logger if it's available.  Extended from loggable gem by viget}
    gem.email = "matt.zumwalt@yourmediashelf.com"
    gem.homepage = "http://github.com/mediashelf/mediashelf-loggable"
    gem.authors = ['Patrick Reagan',"Matt Zumwalt"]
    gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end
