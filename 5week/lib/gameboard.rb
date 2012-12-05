
class GameBoard
  def set_locations_cells locations
    @locations = locations
  end

  def check_yourself user_guess
    answer = hit_miss_or_done(user_guess.to_i)
    @locations.empty?  ? "kill"  : answer
  end

  private
    def hit_miss_or_done(guess)
      @locations.delete(guess) ? "Hit" || (@locations.empty? and "End") : "Miss"
    end
end
