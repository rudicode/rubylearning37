#!/usr/bin/env ruby
require('./lib/playfair')

key = 'Playfair Example.'
input_message = 'Hide the gold in the tree stump'
pc = Playfair.new key
p estr = pc.encrypt(input_message)  #=> "BMODZBXDNABEKUDMUIXMMOUVIF"
p pc.decrypt estr                   #=> "HIDETHEGOLDINTHETREXESTUMP"
require 'pp'
pp pc.square
