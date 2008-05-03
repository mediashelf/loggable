class LoggerStub
  
  [:debug, :error, :fatal, :info, :warn].each do |method|
    define_method(method) do
      nil
    end
  end
  
end