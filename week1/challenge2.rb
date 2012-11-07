require File.expand_path('../convert', __FILE__)

puts <<LIST_INSTRUCTIONS

Temperature converter.
Input the temperature you wish to convert using the following syntax:

32 F to C        converts 32 Fahrenheit to Celsius
37 C to F        converts 37 Celsius to Fahrenheit
32 F to K        converts 32 Fahrenheit to Kelvin

q                Quits
LIST_INSTRUCTIONS

while true
  
  print "\nConvert: "
  input = gets.chomp.downcase.split(' ')

   # puts "Converting #{ input } "  #debuging input
  
  if input[0] == 'q'
    break
  end
  
  from = input[1]
  to = input[3]
  temperature = input[0].to_f
  result = ""
  
  result = convert(temperature, from, to)
    
  if result.class != Float #"error"
    puts "\nError: #{ result }\n *** Sorry I do not know what you mean, by #{ input.join(' ') }\n\n"
  else 
    puts "#{ result } #{ to.to_s.capitalize }"
  end

end