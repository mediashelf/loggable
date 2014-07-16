require File.dirname(__FILE__) + '/../test_helper'

class MyClass
  def logged_method
    logger.debug 'message'
  end
end

module MyModule; end

class LogMethodsTest < Test::Unit::TestCase
  context "An instance of MyClass, with loggable mix-in" do

    setup    { @logger = mock() }
    teardown { MyClass.logger = nil}

    should "have a logger stub by default" do
      assert_instance_of Logger, MyClass.logger
    end

    should "not fail when an instance calls an uninitialized logger" do
      m = MyClass.new
      assert_nothing_raised { m.logged_method }
    end

    should "allow the asssignment of a logger" do
      MyClass.logger = @logger
      assert_equal MyClass.logger, @logger
    end

    should "allow access to the logger from an instance" do
      MyClass.logger = @logger
      assert_equal MyClass.new.logger, @logger
    end

  end

  context "MyModule, with loggable mix-in" do

    should "have a logger stub by default" do
      MyModule.logger = nil
      assert_kind_of Logger, MyModule.logger
    end

    should "be able to log messages" do
      logger = mock()
      logger.expects(:debug).with('blip')
      
      MyModule.logger = logger
      MyModule.logger.debug('blip')
    end

  end
  
  context "MyModule with Rails defined but not initialized" do
    setup do
      class ::Rails
      end 
    end
    
    teardown do
      Object.send(:remove_const, :Rails)
    end
    
    should "use the default logger" do
      MyModule.logger = nil
      assert_kind_of Logger, MyModule.logger
    end
  end
    
  context "MyModule in Rails3" do
    setup do
      module ::Rails
        class Application;end
        def self.version
          return "3.0.0"
        end
        def self.logger
          return "I'm a Rails Logger."
        end
      end 
    end
    
    teardown do
      Object.send(:remove_const, :Rails)
    end
    
    should "use Rails3 logger" do
      MyModule.logger = nil
      assert_equal MyModule.logger, Rails.logger
    end
    should "switch to using Rails3 logger even if a default logger was already defined" do
      MyModule.logger = Logger.new(STDOUT)
      assert_equal MyModule.logger, Rails.logger
    end
  end
end
