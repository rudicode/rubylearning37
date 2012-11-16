require File.expand_path('../convert', __FILE__)

def display result, units
  puts "#{ result } #{ units.to_s.capitalize }"
end

puts <<LIST_INSTRUCTIONS

Temperature converter.

Input the temperature you wish to convert using the following syntax:

32 F to C        converts 32 Fahrenheit to Celsius
37 C to F        converts 37 Celsius to Fahrenheit
32 F to K        converts 32 Fahrenheit to Kelvin
32 F to R        converts 32 Fahrenheit to Rankine

q                Quits
LIST_INSTRUCTIONS

input = ""


while input[0] != 'q'
  
  print "\nConvert: "
  input = gets.chomp.downcase.split(' ')
  break if input[0] == 'q'
    # puts "Converting #{ input } "  #debuging input
  from = input[1].to_s
  to = input[3].to_s
  temperature = input[0].to_f
  
  display convert(temperature, from, to), to
    
  # if result.class != Float
  #   puts "\nError: #{ result }\n *** Sorry I do not know what you mean, by #{ input.join(' ') }\n\n"
  # else 
  #   puts "#{ result } #{ to.to_s.capitalize }"
  # end

end
