require_relative("rectangle")

rectangle = Rectangle.new(23.45, 34.67)
puts "\nCreated new rectangle, length #{ rectangle.length } and width #{ rectangle.width }"
puts "Area is = %.4f" % rectangle.area
puts "Perimeter is = %.4f" % rectangle.perimeter

rectangle.width  = 4.0
rectangle.length = 6.0

puts "\nSetting new, length #{ rectangle.length } and width #{ rectangle.width }"
puts "Area is = %.4f" % rectangle.area
puts "Perimeter is = %.4f" % rectangle.perimeter

rectangle.update 5.0, 2.0

puts "\nUpdating to new length #{ rectangle.length } and width #{ rectangle.width }"
puts "Area is = %.4f" % rectangle.area
puts "Perimeter is = %.4f" % rectangle.perimeter
