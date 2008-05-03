require 'loggable/log_methods'
require 'loggable/logger_stub'

Object.send(:extend, Loggable::LogMethods)
Object.send(:include, Loggable::InstanceMethods)