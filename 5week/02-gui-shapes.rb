require_relative 'shapes'

class GUI
  def initialize
    @shapes = []
  end

  def click x,y
    @shapes.each do |shape|
      shape.click(x,y)
    end
  end

  def add shape
    @shapes << shape
  end
end

gui = GUI.new

gui.add Square.new(1,5)
gui.add Circle.new(2,4)
gui.add Triangle.new(3,3)
gui.add Amoeba.new(4,2)

gui.click(1,5)
gui.click(2,4)
gui.click(3,3)
gui.click(4,2)
