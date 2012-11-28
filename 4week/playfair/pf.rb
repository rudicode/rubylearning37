#!/usr/bin/env ruby
require_relative('playfair')

@pf = Playfair.new("playfair example")

puts "Example 1: Using 'playfair example' as the key, the table becomes:"
puts @pf.cipher_square

enc1 = @pf.encode_message("HIDETHEGOLDINTHETREXESTUMP")
puts "Encoded: #{enc1}"
puts "Decoded: #{@pf.decode_message(enc1)}"
