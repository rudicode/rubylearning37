#!/usr/bin/env ruby
require File.expand_path('../../week2/prompt', __FILE__)

def yelling? string
    string == string.upcase if string.index(%r/[a-z]|[A-Z]/)
end

def talking_money? string
  string.index(%r/\$\d+/)
end

def grandma_says
   (1930..1950).to_a.sample
end

until "BYE" == (sonny_says = prompt('You say to Grandma').strip)
  print "Grandma responds: "
  if talking_money? sonny_says
    puts "STASH THE CASH IN THE COOKIE JAR!"
  elsif yelling? sonny_says
    puts "NO, NOT SINCE #{ grandma_says }!"
  else
    puts "HUH?! SPEAK UP, SONNY!"
  end
  puts
end
