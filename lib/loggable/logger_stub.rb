class LoggerStub
  
  [:debug, :error, :fatal, :info, :warn].each do |method|
    class_eval <<-CODE
      def #{method}(message); nil; end
    CODE
  end
  
end