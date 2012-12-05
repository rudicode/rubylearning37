require_relative '../lib/shapes'
require_relative '../lib/gui'
# The note here is to run and edit from the 'project root' folder

gui = GUI.new

gui.add(Square.new("square"))
gui.add(Circle.new("circle"))
gui.add(Triangle.new("triangle"))
gui.add(Amoeba.new("amoeba"))

gui.click("square")
gui.click("circle")
gui.click("triangle")
gui.click("amoeba")
