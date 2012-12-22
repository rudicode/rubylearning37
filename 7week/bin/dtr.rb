require './lib/dtrconverter'

m = DTRConvertor.new
puts m.convert(100.0)

# reopen class and patch it the monkey way
class DTRConvertor
  def convert amount
    amount * 38.0
  end
end

puts m.convert(100.0)
