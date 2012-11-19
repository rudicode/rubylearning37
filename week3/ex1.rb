#!/usr/bin/env ruby
# local variables with same name are realy 2 different variables
def method
 a = 50
 puts a
end
a = 10
method
puts a
