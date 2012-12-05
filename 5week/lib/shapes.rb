
class Shape
  attr_reader :name

  def initialize shape, sound_extension = ".aif"
    @name = shape
    @sound_extension = sound_extension
    @rotation_point = "center"
    @rotation_direction = "clockwise"
  end

  def animate
    puts rotate
    puts play_sound
  end

  def rotate
    "#{@name.capitalize} is rotating 360 deg #{@rotation_direction} around the #{@rotation_point}."
  end

  def play_sound
    "Playing the #{@name}#{@sound_extension} file."
  end
end

Square = Shape

Circle = Shape

class Triangle < Shape
end

class Amoeba < Shape

  def initialize shape, sound_extension = ".hif"
    super
    @rotation_point = "endpoint"
    @rotation_direction = "counter-clockwise"
  end
end

Square.new.spin
