#!/usr/bin/env ruby
#
#
def usage
  unless ARGV.length == 2 && File.exist?(ARGV[0]) && File.exist?(ARGV[1])
    puts <<-LIST_INSTRUCTIONS
  
  Switch the contents of two files.
  
  Usage: ex2.rb FILE1 FILE2
  
         FILE1      the first file
         FILE2      the second file
  
  example:
           ex2.rb words1.txt words2.txt
  
  LIST_INSTRUCTIONS
    exit 1
  end
end

usage

first_filename = ARGV[0]
second_filename = ARGV[1]
temp_filename = ""

until File.exists?(temp_filename) do
  temp_filename = "swapfiles-#{rand(45000)}"
  if File.exists?(temp_filename)
    tempfile = ""
  else  
    File.rename(first_filename, temp_filename)
  end 
end

File.rename(second_filename, first_filename)
File.rename(temp_filename, second_filename)
