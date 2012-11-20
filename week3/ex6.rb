#!/usr/bin/env ruby
require File.expand_path('../../week2/prompt', __FILE__)

def yelling? string
  string == string.upcase
end

def grandma_random_year
   years = (1930...1951).to_a
   years[rand(years.size)]
end

input = ""

until input == "BYE"
  input = prompt 'You say to Grandma'
  print "Grandma responds: "
  if yelling? input

    puts "NO, NOT SINCE #{ grandma_random_year }!"
  else
    puts "HUH?! SPEAK UP, SONNY!"
  end
end

