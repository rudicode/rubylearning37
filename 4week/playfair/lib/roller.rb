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
    @position += 1 and eod and @position = 0
    @data[@position]
  end

  def reset
    @position = -1
  end

  private
    def eod
      @position == @data.length
    end

end
