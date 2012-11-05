seconds = 979000000
# years = format("%.2f", (seconds.to_f / 60 / 60 / 24 / 365) )
years = "%.2f" % (seconds.to_f / 60 / 60 / 24 / 365)
puts "#{seconds} seconds old is, #{years} years old."