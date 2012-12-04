require_relative 'shapes'

class GUI
  def initialize
    @square = Square.new("square")
    @circle = Circle.new("circle")
    @triangle = Triangle.new("triangle")
  end

  def click shape
    if shape == "square"
      @square.animate
    end

    if shape == "circle"
      @circle.animate
    end

    if shape == "triangle"
      @triangle.animate
    end
  end
end

gui = GUI.new
gui.click("square")
gui.click("circle")
gui.click("triangle")

