
class Shape
  attr_reader :name

  def initialize x, y, sound_extension = ".aif"
    @pos_x = x
    @pos_y = y
    @name = self.class.to_s.downcase

    @sound_extension = sound_extension
    @rotation_point = "center"
    @rotation_direction = "clockwise"
  end

  def click_on x,y
    if x == @pos_x && y == @pos_y
      animate
    end
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

class Square < Shape
end

class Circle < Shape
end

class Triangle < Shape
end

class Amoeba < Shape

  def initialize x, y, sound_extension = ".hif"
    super
    @rotation_point = "endpoint"
    @rotation_direction = "counter-clockwise"
  end
end
