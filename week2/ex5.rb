#!/usr/bin/env ruby
x = 10
y = 20
x, y = y, x
puts x  # => now x is 20
puts y  # => now y is 10

# does it work for strings too?
string1 = "and away!"
string2 = "Up, up "

puts string1 + string2

string1, string2 = string2, string1

puts string1 + string2
