
class GameBoard
  
  def initialize
    @hits = [] 
  end
 
  def set_locations_cells locations
    @locations = locations.to_a
  end

  def check_yourself user_guess
    guess = user_guess.to_i
    answer = "MISS"   
    if @locations.include?(guess)
     answer = "HIT"
     @hits << user_guess
     @hits.uniq!
    end
    if @hits.length >= 3
      answer = "KILL"
    end
    answer  
  end
end
