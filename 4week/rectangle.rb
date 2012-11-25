class Rectangle
  
  attr_accessor :rounding
  
  def initialize length, width
    @length = length
    @width = width
    @rounding = 4
  end
  
  def area
    ( "%.#{@rounding}f" % (@length * @width) ).to_f
  end

  def perimeter
    ( "%.#{@rounding}f" % (@length * 2 + @width * 2) ).to_f
  end
end


