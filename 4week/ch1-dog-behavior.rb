#!/usr/bin/env ruby
#
require_relative("dog")

d = Dog.new('Lassie')
d.teach_trick(:dance) { "#{@name} is dancing!" }
puts d.dance
d.teach_trick(:poo) { "#{@name} is a smelly doggy!" }
puts d.poo
puts

d2=Dog.new('Fido')
puts d2.dance
d2.teach_trick(:laugh) { "#{@name} finds this hilarious!" }
d2.teach_trick(:laugh) { "#{@name} finds this EVEN MORE hilarious!" }
d2.teach_trick(:hi) { "#{@name} says HI!" }
d2.teach_trick(:ruboto) { "#{@name} says 'who is ruboto?'" }
puts d2.laugh
puts d2.hi
puts d2.ruboto
puts
puts d.laugh
puts d.hi
puts d.ruboto
puts

d3=Dog.new('Stimpy')
puts d3.dance
puts d3.laugh
puts d3.chase_cat
