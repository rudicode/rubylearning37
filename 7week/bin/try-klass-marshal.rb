class Klass
  def initialize message
    @message = message
  end
  
  def say_hello
    @message
  end
end

obj = Klass.new("hello")
puts obj.say_hello


File.open('myklass.sav', 'w+') do |f|  
  Marshal.dump(obj, f)  
end


File.open('myklass.sav') do |f|  
  @loaded_obj = Marshal.load(f)  
end

puts @loaded_obj.say_hello  
