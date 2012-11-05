
def year_month seconds
  years = (seconds.to_f / 60 / 60 / 24 / 365)
  whole_years = years.to_i
  months = ((years - whole_years) * 12).to_i 
  "#{seconds} seconds old is, #{whole_years} years and #{ months } months old."
end

puts year_month 979000000
puts year_month 2158493738
puts year_month 246144023
puts year_month 1270166272
puts year_month 1025600095

puts year_month 1
puts year_month 31536000
puts year_month 31535999
