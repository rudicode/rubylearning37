#!/usr/bin/env ruby
#
#The number of participants who did not attempt Quiz 1 is x out of y total participants.
#
def count_missed quiz
    quiz.count(0)
end


quiz = [0,0,0,1,0,0,1,1,0,1]
quiz2 = [0, 0, 0, 0, 0, 0, 1, 2, 4, 6]

puts "The number of participants who did not attempt Quiz 1 is #{ count_missed quiz } out of #{ quiz.size } total participants."
puts "The number of participants who did not attempt Quiz 1 is #{ count_missed quiz2 } out of #{ quiz2.size } total participants."
