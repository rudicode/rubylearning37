#!/usr/bin/env ruby
#
class Person
  attr_reader :balance

  def initialize
    @balance = "$42.50"
  end
end

begin
  mike = Person.new()
  puts mike.balance
  mike.balance = "$10.00"
  puts mike.balance
rescue Exception => e
  puts e
end
#
# A different way
#
puts "A different way to define a class"
person = Class.new do
  attr_reader :balance
  def initialize balance = "$65.23"
    @balance = balance
  end
end
#
begin
  tom = person.new()
  puts tom.balance
  tom.balance = "$15.00"
  puts tom.balance
rescue Exception => e
  puts e
end
