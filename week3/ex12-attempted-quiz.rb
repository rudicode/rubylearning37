#!/usr/bin/env ruby
#
#The number of participants who did not attempt Quiz 1 is x out of y total participants.
#
def count_participants quiz
    quiz.reduce(0) { |sum, num| sum += num }
end


def count_participants2 quiz
  quiz.reduce(0) do |acc, num|
    acc += 1 unless num == 0
    acc
  end
end

def count_participants3 quiz
  count = 0
  quiz.each do |mark|
    count += 1 if mark.odd?
  end
  count
end

def count_participants4 quiz
  quiz.reduce(0) do |acc, num|
    acc += 1 if num < 0
    acc
  end
end

quiz = [0,0,0,1,0,0,1,1,0,1]

puts "The number of participants who did not attempt Quiz 1 is #{ count_participants quiz } out of #{ quiz.size } total participants."


# caution experimental. ;-)

puts "\n\nExperimental ... \n\n"
puts "The number of participants who did not attempt Quiz 1 is #{ count_participants2 quiz } out of #{ quiz.size } total participants."
puts "The number of participants who did not attempt Quiz 1 is #{ count_participants3 quiz } out of #{ quiz.size } total participants."


# negative value indicates "not attempted quiz"
# positive value (including 0) indicates  quiz score"
quiz_with_score = [ -2, -1, -1, 6, 8, 9, -1, 0, -3]
puts "\n\nWith scores"
puts "The number of participants who did not attempt Quiz 1 is #{ count_participants4 quiz_with_score } out of #{ quiz_with_score.size } total participants."
