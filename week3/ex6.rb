#!/usr/bin/env ruby
require File.expand_path('../../week2/prompt', __FILE__)

def yelling? string
    string == string.upcase if string.index(%r/[a-z]|[A-Z]/)
end

def grandma_remembers
   years = (1930..1950).to_a
   years[rand(years.size)]
end

until "BYE" == (sonny_says = prompt('You say to Grandma').strip)
  print "Grandma responds: "
  if yelling? sonny_says

    puts "NO, NOT SINCE #{ grandma_remembers }!"
  else
    puts "HUH?! SPEAK UP, SONNY!"
  end
end
