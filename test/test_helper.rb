require 'rubygems'
require 'test/spec'
require 'mocha'

$TESTING=true
$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'loggable'
