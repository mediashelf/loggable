module Loggable
  
  module LogMethods
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