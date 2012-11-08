# temperature converter

# Fahrenheit to Kelvin
def f_to_k fahrenheit
  ( fahrenheit + 459.67 ) * 5 / 9
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
  ( kelvin * 9 / 5 )- 459.67
end

# Kelvin to Kelvin
def k_to_k kelvin
  kelvin
end

# Rankine to kelvin
def r_to_k rankine
  kelvin = rankine * 5 / 9
end

# Kelvin to Rankine
def k_to_r kelvin
  rankine = kelvin * 9 / 5
end

def convert(temperature, from, to)
  # convert from given units to kelvin
  kelvin = "Incorrect Input"
  case
    when from == 'f'
      kelvin = f_to_k(temperature)
    when from == 'c'
      kelvin = c_to_k(temperature)
    when from == 'r'
      kelvin = r_to_k(temperature)
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
    when to == 'r'
      to_temperature = k_to_r(kelvin)
    when to == 'k'
      to_temperature = kelvin
    return to_temperature
  end
  
end