#!/usr/bin/env ruby
#
# Exercise5. Given a string s = 'key=value', create two strings s1 and s2
# such that s1 contains key and s2 contains value.
# Hint: Use some of the String functions.
#

def get_key_value pair
  key, match, value = pair.partition("=")
  [key, value]
end

pairs = ['key=value', 'animal   =   cat', 'person=Mike E. Smith']

pairs.each do |pair|
  key, value = get_key_value pair
  puts "#{ key } = #{ value }"
end
