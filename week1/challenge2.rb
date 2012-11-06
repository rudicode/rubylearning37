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

def convert(temperature, from, to)
  # convert from given units to kelvin
  kelvin = "Incorrect Input"
  case
    when from == 'f'
      kelvin = f_to_k(temperature)
    when from == 'c'
      kelvin = c_to_k(temperature)
    when from == 'k'
      kelvin = temperature
    else
      return kelvin
  end
  
  if kelvin < 0
    return "Temperature out of range, #{ kelvin } K is too low."
  end
    # puts "Debug: to kelvin is now: #{ kelvin }"
  
  # convert from kelvin to desired units
  to_temperature = "Incorrect Output"
  case
    when to == 'f'
      to_temperature = k_to_f(kelvin)
    when to == 'c'
      to_temperature = k_to_c(kelvin)
    when to == 'k'
      to_temperature = kelvin
    return to_temperature
  end
  
end

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