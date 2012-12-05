require_relative 'shapes'

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

gui = GUI.new

gui.add Square.new("square")
gui.add Circle.new("circle")
gui.add Triangle.new("triangle")
gui.add Amoeba.new("amoeba")

gui.click "square"
gui.click "circle"
gui.click "triangle"
gui.click "amoeba"
