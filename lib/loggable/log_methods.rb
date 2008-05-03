module Loggable
  
  module LogMethods
    
    # Use this method on any of your classes to trigger the logging facility:
    #
    #   MyClass.logger = Logger.new('/path/to/logfile)
    #
    # Now you can call the 'logger' method inside a class or instance method to log at
    # the specified level.  See the README for details.
    #
    def logger=(logger)
      extend ClassMethods
      include InstanceMethods
      
      self.set_logger(logger)
    end
    
    def logger; LoggerStub.new; end
    
  end
  
  module ClassMethods

    def set_logger(logger)
      @@logger = logger
    end
    
    def logger
      @@logger
    end
    
  end
  
  module InstanceMethods
    def logger
      self.class.logger
    end
  end
  
end