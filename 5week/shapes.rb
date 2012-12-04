
class Shape
  def initialize shape 
    @shape = shape 
  end

  def animate
    puts "#{@shape} is rotating 360 deg cw."
    puts "Playing #{@shape} aif sound" 
  end
end

class Square < Shape
  def initialize(shape)
    super    
  end

end

class Circle < Shape
  def initialize(shape)
    super    
  end


end

class Triangle < Shape
  def initialize(shape)
    super    
  end

end
