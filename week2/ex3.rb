# week 2 exercise3
#
# Write a method leap_year?. It should accept a year value from the user,
# check whether it's a leap year, and then return true or false.
# With the help of this leap_year?() method calculate and display the
# number of minutes in a leap year (2000 and 2004) and the number of minutes
# in a non-leap year (1900 and 2005). Note: a century year, like 1900 and 2000,
# is a leap year only if it is divisible by 400.
#
# From wikipedia... Mostly, a year is a leap year if it is evenly divisible
# by four. A year divisible by 100, however, is not a leap year on the
# Gregorian calendar unless it is also divisible by 400.
# For example, 1600 was a leap year, but 1700, 1800 and 1900 were not.
#

MINUTES_IN_ONE_DAY = 1440

def leap_year? year
  if year % 400 == 0
   return year % 100 == 0 ? false : true
  else
    return year % 4 == 0 ? true : false
  end
end

def minutes_in_year year
  #total_minutes = MINUTES_IN_ONE_DAY * 365
  #total_minutes += MINUTES_IN_ONE_DAY if leap_year? year
  #return total_minutes
  
  # the following uses one less variable assignment
  return MINUTES_IN_ONE_DAY * 366 if leap_year? year
  return MINUTES_IN_ONE_DAY * 365
end

1598.upto(2012).each do |year|
  if leap_year? year
    puts "#{ year } IS a leap year"
  else
    puts  "    #{ year } is NOT a leap year"
  end
  
end

1598.upto(2013).each do |year|
  minutes = minutes_in_year year
  puts "Year #{ year } has #{ minutes } minutes, or #{ minutes / MINUTES_IN_ONE_DAY } days."
end





