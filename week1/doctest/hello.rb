=begin
doctest: Hello method that returns "Hello World!"
>> hello
=> "Hello World!"
doctest: 42's ancestors are
>> 42.class.ancestors
=> [Fixnum, Integer, Numeric, Comparable, Object, Kernel, BasicObject] 
=end

def hello
  "Hello World!"
end

