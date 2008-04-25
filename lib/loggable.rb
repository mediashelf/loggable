module Loggable
  
  module LogMethods
    
    # Including this in your class definition will add the ability to use a logger within
    # your class:
    #
    #  class MyClass
    #    loggable
    #  end
    # 
    # Now you can assign a logger instance to this class and have it write to the specified
    # logfile.  See the README for details.
    #
    def loggable
      extend ClassMethods
      include InstanceMethods
    end
  end
  
  module ClassMethods
    
    @@logger = nil
    
    def logger=(logger)
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

Object.send(:extend, Loggable::LogMethods)