#!/usr/bin/env ruby
# week3 exercise3
#
  #Display your current working directory.
  #Create a new directory tmp under your working directory.
  #Change your working directory to tmp
  #Display your current working directory.
  #Go back to your original directory.
  #Delete the tmp directory.
#

def display_working_directory
  puts "Current working directory is: #{ Dir.pwd }"
end

temp_dir="tmp"

display_working_directory
Dir.mkdir(temp_dir)
Dir.chdir(temp_dir)
display_working_directory
Dir.chdir("..")
Dir.rmdir(temp_dir)
display_working_directory

