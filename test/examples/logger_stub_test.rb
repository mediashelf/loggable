require File.dirname(__FILE__) + '/../test_helper'

class LoggerStubTest < Test::Unit::TestCase
  context "An instance of the LoggerStub class" do

    setup { @logger = LoggerStub.new }

    should "return nil for all standard logging methods" do
      [:debug, :error, :fatal, :info, :warn].each do |method|
        @logger.send(method, 'message').should be(nil)
      end
    end

  end
end