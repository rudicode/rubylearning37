class Rectangle
  
  def initialize length, width
    @length = length
    @width = width
  end
  
  def area
    @length * @width
  end

  def perimeter
    @length * 2 + @width * 2 
  end
end


