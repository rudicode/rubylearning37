#!/usr/bin/env ruby
#
def insert_word str, find, insert
  output = "#{insert} #{find}"
  str.gsub(find, output)
end

def update_file filename, find, insert
  temp_file_name = "temp.tmp"
  puts "Updating file: #{ filename } "

  file_in  = File.new(filename, "r")
  file_out = File.new(temp_file_name, "w")

  while line_in = file_in.gets
    file_out.puts(insert_word(line_in, find, insert))
  end

  file_in.close
  file_out.close

  File.delete filename
  File.rename(temp_file_name, filename)
end

#
if ARGV.length != 3
  puts ARGV.length
  puts <<LIST_INSTRUCTIONS

Inserts given text before each occurance of found text.

Usage: ex2.rb FILE find insert

       FILE       the file to update
       find       the word to find in file
       insert     the word that replaces each occurance of find

example:
         ex2.rb ex2-words.txt word inserted

LIST_INSTRUCTIONS
  exit 1
end

filename = ARGV[0]
find     = ARGV[1]
insert   = ARGV[2]
#
if File.exist?(filename)
  update_file(filename, find, insert)
else
  puts "File: '#{ filename }' does not exist"
end
