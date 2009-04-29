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
      MyClass.logger.should be_kind_of(LoggerStub)
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
      MyModule.logger.should be_kind_of(LoggerStub)
    end

    should "be able to log messages" do
      logger = mock()
      logger.expects(:debug).with('blip')
      
      MyModule.logger = logger
      MyModule.logger.debug('blip')
    end

  end
end