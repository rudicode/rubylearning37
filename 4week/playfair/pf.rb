#!/usr/bin/env ruby
require_relative('playfair')

@pf = Playfair.new("playfair example")

puts "Example 1: Using 'playfair example' as the key, the table becomes:"
# @pf.set_key_phrase("playfair example")
puts @pf.cipher_square

#puts "\nExample 2: Using 'I Love Ruby.' as the key, the table becomes:"
#@pf.set_key_phrase("I Love Ruby.")
#puts @pf.cipher_square
@pf.encode_message("pzLLO")
