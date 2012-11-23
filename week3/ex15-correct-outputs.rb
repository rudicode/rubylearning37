#!/usr/bin/env ruby
#
for i, j in [["a", 2, "gg"], [3, 4], [5, "f"],["hh"]]
  print "i=#{i}  j=#{j}  :"
  p [i, j]
end

three_elements = [ [1, 2, "a"], [3, 4, "b"], [5, 6, "c"], [7, 8, "d"] ]
puts"\n\nThree variables: #{ three_elements }\n\n"
for i, j, k in three_elements
  print "i=#{i}  j=#{j}  k=#{k}:"
  p [i, j, k]
end

puts"\n\nThree variables using each: #{ three_elements }\n\n"
three_elements.each do |i,j,k|
  print "i=#{i}  j=#{j}  k=#{k}:"
  p [i, j, k]
end

single_arry = [ 6, 7, 8, 9, 10 ]
puts"\n\nSingle array: #{ single_arry }\n\n"
for i,j in single_arry
  print "i=#{i}  j=#{j}  :"
  p [i, j]
    # in this case j is always nil
end
