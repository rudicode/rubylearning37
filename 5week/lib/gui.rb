require './lib/shapes'

class GUI
  def initialize
    @shapes = []
  end

  def click name
    @shapes.each do |shape|
      if shape.name == name
        shape.animate
      end
    end
  end

  def add shape
    @shapes << shape
  end
end

