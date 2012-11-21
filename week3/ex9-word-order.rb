#!/usr/bin/env ruby
#
def reverse_words word_list
  word_list.split.reverse.join(" ")
end

puts reverse_words "one two three"

=begin

Exploring in irb

$ irb
1.9.3p194 :001 > "one two three".split
 => ["one", "two", "three"]
1.9.3p194 :002 > "one two three".split.reverse
 => ["three", "two", "one"]
1.9.3p194 :003 > "one two three".split.reverse.join
 => "threetwoone"  #aghh no spaces...try again
1.9.3p194 :004 > "one two three".split.reverse.join(" ")
 => "three two one"
1.9.3p194 :005 >
=end
