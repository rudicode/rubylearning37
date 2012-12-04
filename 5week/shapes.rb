
class Shape
  attr_reader :name

  def initialize shape 
    @name = shape
  end

  def animate
    puts "#{@name.capitalize} is rotating 360 deg counter-clockwise."
    puts "Playing the #{@name}.aif file." 
  end
end

class Square < Shape
end

class Circle < Shape
end

class Triangle < Shape
end

class Amoeba < Shape
  def animate
    puts "#{@name.capitalize} is rotating 360 deg counter-clockwise, around an endpoint."
    puts "Playing the #{@name}.hif file." 
  end
end
