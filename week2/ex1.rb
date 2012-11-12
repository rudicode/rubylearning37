s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"

count = 1
s.each_line do |line|
  puts "Line #{ count }: #{ line }"
  count += 1
end

