#!/usr/bin/env ruby
#
a = %w( vvvvv z xxx yy wwww )
b = ["Magazine", "Sunday", "Jump"]

puts <<ANSWERS
1. a.sort
2. a.sort { |s| s }
3. a.sort { |l, r| l <=> r }
4. a.sort { |l, r| l.length <=>  r.length }
5. a.sort_by { |s| s }
6. a.sort_by { |s| s.length }
ANSWERS
puts "\n\nInitial array is: #{ a }"
puts "\n1.)"
p a.sort
puts "\n2.)  This Fails"
# p a.sort { |s| s }  # fails
puts "\n3.)"
p a.sort { |l, r| l <=> r }
puts "\n4.)"
p a.sort { |l, r| l.length <=>  r.length }
puts "\n5.)"
p a.sort_by { |s| s }
puts "\n6.)"
p a.sort_by { |s| s.length }

puts "\nThe correct answers are 4. and 6. which compare the string length"
