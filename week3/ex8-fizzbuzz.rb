#!/usr/bin/env ruby
#
def fizzbuzz1
  output = ""
  1.upto(100) do |num|
    fizzbuzz = ""

    if num % 3 == 0
      fizzbuzz += "Fizz"
    end
    if num % 5 == 0
      fizzbuzz += "Buzz"
    end

    if fizzbuzz.empty?
      fizzbuzz = num.to_s
    end
    output += "#{ fizzbuzz }\n"
  end
  output
end

def fizzbuzz2
  output = ""
  1.upto(100) do |num|
  fizzbuzz = num.to_s
    if num % 3 == 0
      fizzbuzz = "Fizz"
    end
    if num % 5 == 0
      fizzbuzz = "" unless fizzbuzz.include?("Fizz")
      fizzbuzz += "Buzz"
    end
    output += "#{ fizzbuzz }\n"
  end
  output
end

unless fizzbuzz1 == fizzbuzz2
  puts "Something is wrong they are not equal"
end

puts fizzbuzz2


