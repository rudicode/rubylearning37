#!/usr/bin/env ruby
=begin
doctest: Setup
>> text = "What is your name?"
doctest: Test prompt if not chomped
>> prompt text, "Zaphod\n", false
=> "Zaphod\n"
doctest: Test prompt if chomped
>> prompt text, "Zaphod\n"
=> "Zaphod"
=end

#
# have done some exploring to see if I can automate the test
# if you send a string as the 2nd argument it will become the
# input and gets does not get called. ||= is tricky
# Think x ||= y    equals    x || x = y
#
def prompt display, input = nil, result_chomped = true
  print "#{ display } =>"
  input ||= gets  # see not above
  result_chomped ? input.chomp : input
end
