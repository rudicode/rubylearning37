#!/usr/bin/env ruby
#
class Person
  attr_reader :balance

  def initialize
    @balance = "$42.50"
  end
end

mike = Person.new()
puts mike.balance
