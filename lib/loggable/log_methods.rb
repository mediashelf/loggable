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
    
    # If RAILS_DEFAULT_LOGGER is defined, that will be returned.
    # If no logger has been defined, a new STDOUT Logger will be created.
    def logger
      # @@logger || LoggerStub.new
      @@logger ||= (defined?(::Rails) && !::Rails.logger.nil?) ? ::Rails.logger : ::Logger.new(STDOUT)
    end
    
  end
  
  module InstanceMethods
    def logger
      self.class.logger
    end
  end
  
end