#!/usr/bin/env ruby

s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"

# from: eelco ten have
#s.each_line.with_index(1) do |line,index|
#  puts "Line #{index}:#{line}"
#end

#here is another way, splitting each line into an array.
s.split("\n").each_with_index do |line, index|
  puts "Line #{ index.next }: #{ line }"
end

