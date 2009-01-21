# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{loggable}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Patrick Reagan"]
  s.date = %q{2009-01-21}
  s.email = %q{patrick.reagan@viget.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "lib/loggable", "lib/loggable/log_methods.rb", "lib/loggable/logger_stub.rb", "lib/loggable/version.rb", "lib/loggable.rb", "test/examples", "test/examples/log_methods_test.rb", "test/examples/logger_stub_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://viget.com/extend}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{viget}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A gem that provides logging capabilities to any class}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
