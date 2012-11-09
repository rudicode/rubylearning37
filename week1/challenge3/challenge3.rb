def pad_number num, length
  num.to_s.rjust(length)
end

def put_decoration integer, box_length
  decoration_length = integer * ( box_length + 1 )
  decoration = " "
  1.upto(decoration_length) do |count|
    decoration << "="
  end
  decoration << "\n"
  end

def multiplication_table (integer, heading = '', decorate = false)
  
  integer = 1 if integer < 1 # smallest size table is 1 x 1
  largest_number = integer * integer
  
  box_length = largest_number.to_s.length
  box_length = 2 if box_length < 2 # ensure it works for very small tables
  
  table =""

  if ! heading.empty?
    table << " #{heading}\n"
  end
  
  if decorate
    table << put_decoration(integer, box_length)
  end

  1.upto(integer) do |row|
    
    1.upto(integer) do |column|
      table << " " << pad_number((row * column), box_length)
    end
    table <<"\n"
  end

  if decorate
    table << put_decoration(integer, box_length)
  end
  
  table.chomp

end

table1 = multiplication_table 9, 'Times Table to 9', true
table2 = multiplication_table 20, '', false
table3 = multiplication_table 1,'Times Table for 1', true
puts table1
puts "\n\n"
puts table2
#puts "\n\n"
#puts table3

#puts "\n\n"
#puts multiplication_table 2,'Times Table for 5', true
#
#puts "\n\n"
#puts multiplication_table 3,'Times Table for 5', true

puts "\n\n"
puts multiplication_table 15,'Times Table for 15', false

puts "\n\n"
puts multiplication_table 0,'Times Table for 0', true
