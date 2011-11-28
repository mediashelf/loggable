module Loggable
  
  module ClassMethods
    
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
    
    # If ::Rails.logger is defined, that will be returned.
    # If no logger has been defined, a new STDOUT Logger will be created.
    def logger
      
      if defined?(::Rails) && ::Rails.respond_to?(:version)
        if ::Rails.version >= "2.1" && !::Rails.logger.nil?
          @@logger = ::Rails.logger
        end
      end
      
      # If none of the above was able to set @@logger, create a new default logger
      @@logger ||= ::Logger.new(STDOUT)
      
      return @@logger
    end
    
  end
  
  module InstanceMethods
    def logger
      self.class.logger
    end
  end
  
end
