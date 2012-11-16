#!/usr/bin/env ruby
#

string_with_10_lines = "Lorem ipsum dolor sit amet,
consectetuer adipiscing elit.
Duis imperdiet sem eu quam.
Donec bibendum tincidunt purus.
Nunc eu tellus sed turpis volutpat pellentesque.
Nunc accumsan varius elit.
Aenean sit amet magna eget odio ornare vulputate.
Ut ullamcorper tellus non magna.
Sed non arcu vel libero posuere ultricies.
In ornare lacus ut turpis.\n"

def digit_size string
  string.lines.count.to_s.size
end

def add_line_numbers input_string, leading_zero = nil
  digit_length = digit_size input_string
  leading_zero &&= 0

  input_string.split("\n").map.with_index do |line, index|
    "Line %#{ leading_zero }#{ digit_length }d: %s" % [index.next, line]
  end
end

puts "Starting 10 Lines"
puts add_line_numbers(string_with_10_lines, true)
sleep(5)
puts "Starting 100 Lines"
puts add_line_numbers(string_with_10_lines * 10)
