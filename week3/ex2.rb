#!/usr/bin/env ruby
#
def update_word str
  str.gsub("word", "inserted word")
end
#
filename = ARGV[0]
puts "Updating file: #{ filename } "
#
if File.exist?(filename)
  file = File.new(filename, "r+")
  text_out = update_word(file.read)
  file.rewind
  file.write(text_out)
  file.close
else
  puts "File: '#{ filename }' does not exist"
end
