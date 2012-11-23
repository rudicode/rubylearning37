#!/usr/bin/env ruby
#
puts <<THIS
h = { "Ruby" => "Matz", "Perl" => "Larry", "Python" => "Guido" }

1. h.member?("Matz")
2. h.member?("Python")
3. h.include?("Guido")
4. h.include?("Ruby")
5. h.has_value?("Larry")
6. h.exists?("Perl")
THIS

h = { "Ruby" => "Matz", "Perl" => "Larry", "Python" => "Guido" }
puts h.member?("Matz")
puts h.member?("Python")
puts h.include?("Guido")
puts h.include?("Ruby")
puts h.has_value?("Larry")
puts h.exists?("Perl")


