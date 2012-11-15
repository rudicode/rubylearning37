#!/usr/bin/env ruby
# puts 5 > 3 ? "yeah" : "boo" #=> nil
# yeah
# puts 5 < 3 ? "yeah" : "boo" #=> nil
# boo
#
# replace above by using logic operators and exploiting
# short-circuiting and precedence?
#
# see http://en.wikipedia.org/wiki/Short-circuit_evaluation
#
#    true  &&  true  || true
puts 5 > 3 && "yeah" || "boo"

#    false &&  true  || true
puts 5 < 3 && "yeah" || "boo"

# something else I found
# 
#@x = 3
@x ||= 7
puts @x
