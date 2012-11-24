#!/usr/bin/env ruby
#

def usage test=nil
    unless ARGV.length == 1 && File.exist?(ARGV[0])

  output = <<LIST_INSTRUCTIONS

Outputs Document statistics

Usage: analyzer FILE

       FILE       the file to analyze

example:
          analyzer.rb text.txt

LIST_INSTRUCTIONS
output
    begin
      puts output
      exit(1) 
    end unless test
  end
end
begin
usage
current_list_of_files = Dir.glob('**/*')
puts current_list_of_files
end if __FILE__ == $0
