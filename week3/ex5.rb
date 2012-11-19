#!/usr/bin/env ruby
#
# Exercise5. Given a string s = 'key=value', create two strings s1 and s2
# such that s1 contains key and s2 contains value.
# Hint: Use some of the String functions.
#

def get_key_value s
  s.gsub!(/\s+/, "") #remove all whitespace

  s1, match, s2 = s.partition("=")

  return s1, s2
end

pair = 'key=value'
s1, s2 = get_key_value pair
puts "#{ s1 } = #{ s2 }"

