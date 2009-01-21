$:.unshift File.dirname(__FILE__)

require 'loggable/log_methods'
require 'loggable/logger_stub'

class Object
  extend Loggable::ClassMethods
  include Loggable::InstanceMethods
end