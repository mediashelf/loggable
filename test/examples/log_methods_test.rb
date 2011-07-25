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
      MyClass.logger.should be_instance_of(Logger)
    end

    should "not fail when an instance calls an uninitialized logger" do
      m = MyClass.new
      lambda { m.logged_method }.should_not raise_error
    end

    should "allow the asssignment of a logger" do
      MyClass.logger = @logger
      MyClass.logger.should == @logger
    end

    should "allow access to the logger from an instance" do
      MyClass.logger = @logger
      MyClass.new.logger.should == @logger
    end

  end

  context "MyModule, with loggable mix-in" do

    should "have a logger stub by default" do
      MyModule.logger = nil
      MyModule.logger.should be_kind_of(Logger)
    end

    should "be able to log messages" do
      logger = mock()
      logger.expects(:debug).with('blip')
      
      MyModule.logger = logger
      MyModule.logger.debug('blip')
    end

  end
  
  context "MyModule in Rails3" do
    setup do
      class ::Rails
        def self.logger
          return "I'm a Rails Logger."
        end
      end 
    end
    
    teardown do
      Object.send(:remove_const, :Rails)
    end
    
    should "use Rails logger" do
      MyModule.logger = nil
      MyModule.logger.should == Rails.logger
    end
    should "switch to using Rails logger even if a default logger was already defined" do
      MyModule.logger = Logger.new(STDOUT)
      MyModule.logger.should == Rails.logger
    end
  end
end