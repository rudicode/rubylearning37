class Roller
  
  def initialize values
    @data = values.to_a
    @position = -1 # first call to next will return first elemet
  end
  
  def all
    @data
  end
  
  def current
    @data[@position]
  end
  
  def next
    @position += 1
    @position = 0 if @position == @data.length
    @data[@position]
  end
  
end