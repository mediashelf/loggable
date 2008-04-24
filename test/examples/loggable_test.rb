require File.dirname(__FILE__) + '/../test_helper'

class MyClass; loggable; end

describe "MyClass, with loggable mix-in" do
  
  before(:each) do
    @logger = mock()
  end
  
  it "should have nothing as a logger by default" do
    MyClass.logger.should.be nil
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