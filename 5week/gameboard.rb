
class GameBoard
  
  def initialize
    @hits = [] 
  end
 
  def set_locations_cells locations
    @locations = locations
  end

  def check_yourself user_guess
    guess = user_guess.to_i
    answer = "Miss"   
    if @locations.include?(guess)
     answer = "Hit"
     @hits << user_guess
     @hits.uniq!
    end
    if @hits.length >= 3
      answer = "END"
    end
    answer
  end
end
