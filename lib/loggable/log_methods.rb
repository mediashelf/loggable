module Loggable
  
  module ClassMethods
    
    @@logger = nil
    
    # Use this method on any of your classes to trigger the logging facility:
    #
    #   MyClass.logger = Logger.new('/path/to/logfile')
    #
    # Now you can call the 'logger' method inside a class or instance method to log at
    # the specified level.  See the README for details.
    #
    def logger=(logger)
      @@logger = logger
    end
    
    def logger
      @@logger || LoggerStub.new
    end
    
  end
  
  module InstanceMethods
    def logger
      self.class.logger
    end
  end
  
end