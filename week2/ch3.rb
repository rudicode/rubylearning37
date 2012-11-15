#!/usr/bin/env ruby
#

string_with_11_lines = "Lorem ipsum dolor sit amet,
consectetuer adipiscing elit.
Duis imperdiet sem eu quam.
Donec bibendum tincidunt purus.
Nunc eu tellus sed turpis volutpat pellentesque.
Nunc accumsan varius elit.
Aenean sit amet magna eget odio ornare vulputate.
Ut ullamcorper tellus non magna.
Sed non arcu vel libero posuere ultricies.
Suspendisse tincidunt ullamcorper tellus.
In ornare lacus ut turpis."

# setup multi line string
temp_array = string_with_11_lines.split("\n")
long_string = ""
1.upto(1015) { |x| long_string << temp_array[rand(temp_array.size)] + "\n" }


def add_line_numbers input_string, leading_zero = nil
  digit_length = input_string.lines.count.to_s.size
  leading_zero = "0" if leading_zero
  output = ""

  input_string.split("\n").each_with_index do |line, index|
    output << "Line %#{ leading_zero }#{ digit_length }d: " % index.next
    output << "%s\n" % line
  end
  output
end

puts "Starting 11 Lines"
puts add_line_numbers(string_with_11_lines, true)

puts "Starting 1015 Lines"
puts add_line_numbers(long_string)
