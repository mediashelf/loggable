require 'rubygems'
require 'bundler'
require 'rake/testtask'

Bundler::GemHelper.install_tasks

# adding tasks defined in lib/tasks
Dir.glob('lib/tasks/*.rake').each { |r| import r }

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end
