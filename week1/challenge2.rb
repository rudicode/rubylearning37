# temperature converter

# Fahrenheit to Celsius
def f_to_c fahrenheit
  # assume it's a float
  ( fahrenheit - 32.0 ) * 5 / 9
end

# Celsius to Fahrenheit
def c_to_f celsius
  # assume it's a float
  celsius *  9 / 5 + 32
end

# Fahrenheit to Kelvin
def f_to_k fahrenheit
  c_to_k(f_to_c(fahrenheit))
end

# Celsius to Kelvin
def c_to_k celsius
  celsius + 273.15
end

# Kelvin to Celsius
def k_to_c kelvin
  kelvin - 273.15
end

# Kelvin to Fahrenheit
def k_to_f kelvin
  c_to_f(k_to_c(kelvin))
end

puts <<LIST_INSTRUCTIONS

Temperature converter.
Input the temperature you wish to convert using the following syntax:

32 F to C        converts 32 Fahrenheit to Celsius
37 C to F        converts 37 Celsius to Fahrenheit
32 F to K        converts 32 Fahrenheit to Kelvin

q                Quits
LIST_INSTRUCTIONS

loop do
  
  print "\nConvert: "
  input = gets.chomp.downcase.split(' ')

   # puts "Converting #{ input } "
  
  if input[0] == 'q'
    break
  end
  
  from = input[1]
  to = input[3]
  temperature = input[0].to_f
  result = ""
  
  case 
    when (from == 'f' && to == 'c')
      result = f_to_c(temperature)
    when (from == 'f' && to == 'k')
      result = f_to_k(temperature)
    when (from == 'c' && to == 'f')
      result = c_to_f(temperature)
    when (from == 'c' && to == 'k')
      result = c_to_k(temperature)
    when (from == 'k' && to == 'f')
      result = k_to_f(temperature)
    when (from == 'k' && to == 'c')
      result = k_to_c(temperature)
    else
      result = "\n *** Sorry I do not know what you mean, by #{ input.join(' ') }\n\n"
  end
  
  puts "#{ result } #{ to.to_s.capitalize }" 

end