require File.dirname(__FILE__) + '/../test_helper'

describe "LoggerStub" do
  
  before(:each) do
    @logger = LoggerStub.new
  end
  
  it "should return nil for all standard logging methods" do
    [:debug, :error, :fatal, :info, :warn].each do |method|
      @logger.send(method).should.be.nil
    end
  end
  
end