#!/usr/bin/env ruby
require_relative('grandma')

@granny = Grandma.new()
@granny.run

#until @granny.three_bye == (sonny = prompt('You say to Grandma').strip)
#  puts "Grandma responds: #{ @granny.answers sonny } \n\n"
#end
