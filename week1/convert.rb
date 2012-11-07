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

# Kelvin to Kelvin
def k_to_k kelvin
  kelvin
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