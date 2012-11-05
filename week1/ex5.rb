#The following program prints the value of the variable. Why?
def my_string
  'Hello World'
end
my_string = 'Hello Ruby World'

puts my_string

puts my_string()
puts send(:my_string)
puts method(:my_string).call
