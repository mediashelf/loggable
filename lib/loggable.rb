$:.unshift File.dirname(__FILE__)

require 'loggable/log_methods'
require 'loggable/logger_stub'

class Object
  include Loggable::InstanceMethods
end

class Class
  include Loggable::ClassMethods
end

class Module
  include Loggable::ClassMethods
end
