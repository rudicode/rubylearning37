#!/usr/bin/env ruby
require_relative('grandma')

@granny = Grandma.new()

puts <<OUTPUT

      Welcome to grandma's house.
      
She sits in her rocking chair, waiting for you to say something.
You may need to shout for her to hear you.
Oh, and if you tell her how many $ you have in your pocket,
you might earn yourself a snack.
Just say BYE three times when you have run out of things to say.

OUTPUT
  
until @granny.bye_limit?
  # puts "BYE Count is: #{ @granny.bye_count }"  #DEBUG:
  sonny = prompt('You say to Grandma').strip
  puts "Grandma responds: #{ @granny.answers sonny } \n\n"
end

