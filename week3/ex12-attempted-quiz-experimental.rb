#!/usr/bin/env ruby
#
#The number of participants who did not attempt Quiz 1 is x out of y total participants.
#
# caution experimental. ;-)

def count_participants quiz
  quiz.reduce(0) do |acc, num|
    puts num
    acc += 1 if num < 0
    acc
  end
end

puts "\nExperimental ... \n\n"

# negative value indicates "not attempted quiz"
# positive value (including 0) indicates  quiz score"
quiz_with_score = [ -2, -1, -1, 6, 8, 9, -1, 0, -3]
puts "\nWith scores"
puts "The number of participants who did not attempt the First Quiz, is #{ count_participants quiz_with_score } out of #{ quiz_with_score.size } total participants."
