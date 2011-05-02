desc "Task to execute builds on a Hudson Continuous Integration Server."
task :hudson do
  Rake::Task["loggable:doc"].invoke
  Rake::Task["loggable:rcov"].invoke
  Rake::Task["loggable:test"].invoke
end

namespace :loggable do    

  require 'rake/testtask'
  Rake::TestTask.new(:test) do |test|
    test.libs << 'lib' << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end

  # Use yard to build docs
  begin
    require 'yard'
    require 'yard/rake/yardoc_task'
    project_root = File.expand_path("#{File.dirname(__FILE__)}/../../")
    doc_destination = File.join(project_root, 'doc')

    YARD::Rake::YardocTask.new(:doc) do |yt|
      yt.files   = Dir.glob(File.join(project_root, 'lib', '**', '*.rb')) + 
                   [ File.join(project_root, 'README.rdoc') ]
      yt.options = ['--output-dir', doc_destination, '--readme', 'README.rdoc']
    end
  rescue LoadError
    desc "Generate YARD Documentation"
    task :doc do
      abort "Please install the YARD gem to generate rdoc."
    end
  end

  require 'rcov/rcovtask'

  desc "Create a cross-referenced code coverage report."
  Rcov::RcovTask.new(:rcov) do |t|
    t.libs << "test"
    t.test_files = FileList['test/**/*_test.rb']
    t.rcov_opts << "--exclude \"gems/*\" --rails" 
  end
end
