#!/usr/bin/env ruby
require_relative('playfair')

@pf = Playfair.new()

puts "Example 1: Using 'playfair example' as the key, the table becomes:"
square = @pf.create_cipher_square("playfair example")
puts @pf.format_cipher_square square

puts "\nExample 2: Using 'I Love Ruby.' as the key, the table becomes:"
square = @pf.create_cipher_square("I Love Ruby.")
puts @pf.format_cipher_square square
