require File.expand_path('../../week2/prompt', __FILE__)

class Grandma
  
  def initialize
    @bye_count = 0
    @bye_limit = 1
  end
  
  def run
    until bye_limit?
      sonny = prompt('You say to Grandma').strip
      puts "Grandma responds: #{ answers sonny } \n\n"
    end
  end

  def yelling? string
    string == string.upcase if string =~ /[a-z]|[A-Z]/
  end
  
  def yelling_bye? string
    # if string has only one captalized BYE then true
    # BYEBYEBYE or BYE BYE BYE should be ignored.
    @bye_count += 1 if string.match(%r/BYE/) 
  end
  
  def talking_money? string
    # string.index(%r/\$\d+/)
    string =~ /\$\d+/
  end
  
  def remembers
    (1930..1950).to_a.sample
  end
  
  def bye_count
    @bye_count
  end

  def bye_count= num
    @bye_count = num
  end
  
  def bye_limit?
    @bye_count >= @bye_limit
  end
  
  def answers sonny
    answer = "HUH?! SPEAK UP, SONNY!"
    if talking_money? sonny
      answer = "STASH THE CASH IN THE COOKIE JAR!"
    elsif yelling_bye? sonny
    elsif yelling? sonny
      answer = "NO, NOT SINCE #{ remembers }!"
    end
    
    if bye_limit?
      answer = "COME VISIT SOON."
    end
    answer
  end
end