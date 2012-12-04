
class GameBoard
  
  def initialize
    # @hits = [] 
    @no_of_hits = 0
  end
 
  def set_locations_cells locations
    @locations = locations
  end

  def check_yourself user_guess
    guess = user_guess.to_i
    answer = "Miss"   
    if @locations.include?(guess)
     answer = "Hit"
     # @hits << user_guess
     # @hits.uniq!
     @no_of_hits += 1
    end
    if @no_of_hits >= 3
      answer = "kill"
    end
    puts answer
    answer
  end
end
