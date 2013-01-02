#!/usr/bin/env ruby
require './prompt'

def yelling? string
    string == string.upcase if string =~ /[a-z]|[A-Z]/
end

def talking_money? string
  string =~ /\$\d+/
end

def grandma_remembers
   (1930..1950).to_a.sample
end

def grandma_answers sonny
  answer = "HUH?! SPEAK UP, SONNY!"
  if talking_money? sonny
    answer = "STASH THE CASH IN THE COOKIE JAR!"
  elsif yelling? sonny
    answer = "NO, NOT SINCE #{ grandma_remembers }!"
  end
  answer
end

until "BYE" == (sonny = prompt('You say to Grandma').strip)
  puts "Grandma responds: #{ grandma_answers sonny } \n\n"
end
