def mtdarry
  10.times do |num|
    puts num
  end
end

puts "Start mtdarry"
mtdarry
puts "Finish mtdarry"

puts "Now... puts mtdarray"
puts mtdarry
puts "Finish puts mtdarry"

puts <<SOMETEXT

Looks like the extra 10 you see from 'puts mtdarry'
is there because 10.times { block code }
evaluates to the integer being used in .times
A method returns the last value evaluated.
so:
6.times {|n| "a" } would return the integer 6

SOMETEXT

result = 6.times {|n| "a" }
puts result

puts <<SOMETEXT

Another example, only returns the integere 7 used in 7.times
To get it to return the answer to the calculation you need to
uncomment the line between the two end(s)

SOMETEXT
def calc_it
  calculation = 0
  7.times do |num|
    calculation = calculation + num
  end
  # calculation
end

puts "the calculation is: #{ calc_it }"

