#!/usr/bin/env ruby

puts expand = defined?( expand ) ? expand : true
# => nil
# Why??

#defined? is an operator in ruby, like and, or, and not
#but it returns "nil" if the argument , in this case "expand", is not defined.
#the above is an assignment during an if like this:

