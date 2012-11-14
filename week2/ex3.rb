#!/usr/bin/env ruby
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

=begin
doctest: Setup years array
>> leap_years = [2000, 2400, 1600, 1604, 1608, 1612]
>> leap_years_1600 = [1600, 1604, 1608, 1612, 1616, 1620, 1624, 1628, 1632, 1636, 1640, 1644, 1648, 1652, 1656, 1660, 1664, 1668, 1672, 1676, 1680, 1684, 1688, 1692, 1696]
>> leap_years_2000 = [2000, 2004, 2008, 2012, 2016, 2020, 2024, 2028, 2032, 2036, 2040, 2044, 2048, 2052, 2056, 2060, 2064, 2068, 2072, 2076, 2080, 2084, 2088, 2092, 2096]
>> non_leap_years = [1901, 1902, 2001, 1998]
>> non_leap_centuries = [100, 1500, 1700, 1800, 1900, 2100]
doctest: leap years
>> leap_years.all? {|year| leap_year?(year) }
=> true
doctest: leap years 1600s
>> leap_years_1600.all? {|year| leap_year?(year) }
=> true
doctest: leap years 2000s
>> leap_years_2000.all? {|year| leap_year?(year) }
=> true
doctest: non-leap years
>> non_leap_years.none? {|year| leap_year?(year) }
=> true
doctest: non-leap centuries
>> non_leap_centuries.any? {|year| leap_year?(year) }
=> false
doctest: minutes in a year
>> minutes_in_year(2000)
=> 527040
>> minutes_in_year(2001)
=> 525600
=end

MINUTES_IN_ONE_DAY = 1440

#
# A year will be a leap year if it is divisible by 4 but not by 100.
# A leap year is also a every year divisible by 400.
#

def leap_year? year
  year % 4 == 0 && year % 100 != 0 || year % 400 == 0
end

def minutes_in_year year
  leap_year?(year) ? MINUTES_IN_ONE_DAY * 366 : MINUTES_IN_ONE_DAY * 365
end


begin

  1880.upto(2012).each do |year|
    leap_year?(year) ? print("#{ year } IS") : print("    #{ year } IS NOT")
    puts " a leap year"
  end

  1998.upto(2013).each do |year|
    minutes = minutes_in_year year
    #puts "Year #{ year } has #{ minutes } minutes, or #{ minutes / MINUTES_IN_ONE_DAY } days."
    puts "Year #{ year } has #{ minutes } minutes, or %d days." % (minutes_in_year(year) / MINUTES_IN_ONE_DAY)
  end

end if __FILE__ == $0
