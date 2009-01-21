$:.unshift File.dirname(__FILE__)

require 'loggable/log_methods'
require 'loggable/logger_stub'

Object.send(:extend, Loggable::ClassMethods)
Object.send(:include, Loggable::InstanceMethods)