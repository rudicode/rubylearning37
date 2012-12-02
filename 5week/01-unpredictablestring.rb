class UnpredictableString < String
  def scramble
    letters = []
    self.each_char {|x| letters << x}
    letters.shuffle.join
  end
  def to_s   
    scramble 
  end
end

sentence = UnpredictableString.new("It was a dark and stormy night.")
puts sentence
puts sentence.scramble

puts `ruby -v`                                                  
puts RUBY_DESCRIPTION
up = UnpredictableString.new("Now is the time for all good men")
puts up                                                         
puts up.scramble
