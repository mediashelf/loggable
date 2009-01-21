require File.dirname(__FILE__) + '/../test_helper'

class MyClass
  def logged_method
    logger.debug 'message'
  end
end

module MyModule; end

describe "MyClass, with loggable mix-in" do
  
  before(:each) do
    @logger = mock()
  end
  
  after(:each) do
    MyClass.logger = nil
  end
  
  it "should have a logger stub by default" do
    MyClass.logger.should.be.an.instance_of(LoggerStub)
  end
  
  it "should not fail when an instance calls an uninitialized logger" do
    m = MyClass.new
    lambda { m.logged_method }.should.not.raise
  end
  
  it "should allow the asssignment of a logger" do
    MyClass.logger = @logger
    MyClass.logger.should.equal @logger
  end
  
  it "should allow access to the logger from an instance" do
    MyClass.logger = @logger
    MyClass.new.logger.should.equal @logger
  end
  
end

describe "MyModule, with loggable mix-in" do
  
  it "should have a logger stub by default" do
    MyModule.logger.should.be.an.instance_of(LoggerStub)
  end
  
  it "should be able to log messages" do
    logger = mock {|m| m.expects(:debug).with('blip') }
    MyModule.logger = logger
    MyModule.logger.debug('blip')
  end
  
end