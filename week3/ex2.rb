#!/usr/bin/env ruby
#
require 'tempfile'
#
def insert_word str, find, insert
  output = "#{insert} #{find}"
  str.gsub(find, output)
end
#
def update_file filename, find, insert
  puts "Updating file: #{ filename } "

  file_in  = File.new(filename, "r")
  file_out = Tempfile.new('update-file', '.')

  while line_in = file_in.gets
    file_out.puts(insert_word(line_in, find, insert))
  end

  file_in.close
  file_out.close

  File.delete filename
  File.rename(file_out.path, filename)
end
#
def usage
  unless ARGV.length == 3 && File.exist?(ARGV[0])
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
end
#
usage
filename, find, insert = ARGV
update_file(filename, find, insert)
