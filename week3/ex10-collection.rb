#!/usr/bin/env ruby
#
# Note there are better ways to implement the following methods.
# Just exploring how inject works :)
# ie. If you have to use inject, how or can you do it?
#
def sum collection
  collection.inject { |result, number| result + number }
end
#
def count_elements collection
  collection_count = 0
  collection.inject(0) { |result, number| collection_count += 1 }
end
#
def join_words word_list
  word_list.inject do |sentence, word|
    sentence << " " << word
  end

end
#
def contains_capital_word? string
  word_list = string.split
  last_capital_word = nil

  word_list.inject(nil) {|capital, word| last_capital_word = word if word =~ /^[A-Z]/}

  last_capital_word
end
#
def upcase_words word_list
    #is there a way to use inject(:upcase) ????
  word_list.inject("") do |sentence, word|
    sentence << word.upcase
      #prevents a trailing space
    unless word == word_list.last
      sentence << " "
    end
    sentence
  end
end
#
#
puts "Sum"
puts sum [1, 2, 3, 4, 5]
puts sum [5, 5, 5, 10]
#
puts "\n\nJoin Words"
puts join_words [ "Bumblebee", "is,", "a", "car." ]
puts count_elements [ "Bumblebee", "is,", "a", "car." ]
#
puts "\n\nContains Capital?"
sentence1 = "hi there how are you doing"
puts sentence1
contains_capital_word?(sentence1) ? puts("Has a capitalized word") : puts("Does not have a capitalized word")
#
puts "\n\nContains Capital?"
sentence2 = "hi there How Are you doing"
puts sentence2
contains_capital_word?(sentence2) ? puts("Has a capitalized word") : puts("Does not have a capitalized word")
#
puts "\n\nUpcase words"
print upcase_words([ "This", "iS", "aLl", "Upcased" ])
puts "..."  #visual check for whitespace
