require File.dirname(__FILE__) + '/../test_helper'

class MyClass
  def logged_method
    logger.debug 'message'
  end
end

describe "MyClass, with loggable mix-in" do
  
  before(:each) do
    @logger = mock()
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