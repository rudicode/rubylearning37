def pad_number num, length
  num.to_s.rjust(length)
end

def put_decoration integer, box_length
  decoration_length = integer * ( box_length + 1 )
  decoration = ""
  decoration = " " if integer > 1
  1.upto(decoration_length) do |count|
    decoration << "="
  end
  decoration << "\n"
end

def multiplication_table (integer, heading = '', decorate = false)
  
  table = ""
  
  return table if integer < 0
    
  if integer == 0
    table = multiplication_table( 1, heading, decorate )
    table.gsub!('1', "0")  #replace the 1 with a zero, ya I know a hack :)
    return table.chomp
  end
    
  largest_number = integer * integer
  
  box_length = largest_number.to_s.length
  box_length = 2 if box_length < 2 # ensure it works for very small tables
  
  if ! heading.empty?
    table << " " if integer > 1
    table << "#{heading}\n"
  end
  
  if decorate
    table << put_decoration(integer, box_length)
  end

  1.upto(integer) do |row|
    
    1.upto(integer) do |column|
      table << " " if integer > 1
      table << pad_number((row * column), box_length)
    end
    table << "\n"
  end

  if decorate
    table << put_decoration(integer, box_length)
  end
  
  table.chomp

end

tables = [ multiplication_table(9, 'Times Table to 9', true),
  multiplication_table(20, '', false),
  multiplication_table(1,'Times Table for 1', true),
  multiplication_table(0,'Times Table for 0', true),
  multiplication_table(-10 ,'Times Table for -10', true) ]

tables.each do |table|
  puts table
  puts "\n"
end
