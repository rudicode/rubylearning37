#!/usr/bin/env ruby
#

def usage
  unless ARGV.length == 1 && File.exist?(ARGV[0])
  puts <<LIST_INSTRUCTIONS

Shows all newer files in current directory

Usage: show-new-files FILE

       FILE       containes list of older files

example:   show-new-files.rb snapshot.txt
Notes: to create snapshot, use inventory.rb

LIST_INSTRUCTIONS
  exit(1) 
  end
end

def get_old_list filename
  file_in = File.new(filename, "r")
  names = []
  while line_in = file_in.gets
    names << line_in.chomp
  end
  file_in.close
  names
end

def find_new_files old, current
  new = []
  current.each do |file|
    unless old.include?(file)
        new << file
    end
  end
  new
end

###

usage
current_list = Dir.glob('**/*')
old_list = get_old_list(ARGV[0])
new_list = find_new_files old_list, current_list
#
puts "NEW FILES\n---------\n\n"
puts new_list
