require_relative("01-dog-class")

dog_leo = Dog.new('Leo')

puts "Name: #{ dog_leo.name }"
puts "I can eat           : #{ dog_leo.eat }"
puts "I can bark          : #{ dog_leo.bark }"
puts "I can chase the cat : #{ dog_leo.chase_cat }"