#!/usr/bin/env ruby
#
def update_word str
  str.gsub("word", "inserted word")
end
#
filename = ARGV[0]
puts "Updating file: #{ filename } "
#
# need error checking if file exists
file = File.new(filename, "r+")
text_out = update_word(file.read)
file.rewind
file.write(text_out)
file.close
