#!/usr/bin/env ruby
require('./lib/playfair')

@pf = Playfair.new("playfair example")

puts "Example 1: Using 'playfair example' as the key, the table becomes:"
puts @pf.cipher_square

enc1 = @pf.encrypt("japan")
puts "Encoded: #{enc1}"
puts "Decoded: #{@pf.decrypt(enc1)}"
