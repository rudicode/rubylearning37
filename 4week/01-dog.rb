require_relative("dog")

dog_leo = Dog.new('Leo')

puts <<OUTPUT
Name: #{ dog_leo.name }
I can eat           : #{ dog_leo.eat }
I can bark          : #{ dog_leo.bark }
I can chase the cat : #{ dog_leo.chase_cat }
OUTPUT
