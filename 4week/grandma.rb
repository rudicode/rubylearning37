#require File.expand_path('../../week2/prompt', __FILE__)
require_relative('prompt')

class Grandma
  
  attr_reader :bye_count
  
  def initialize bye_limit = 3
    @bye_count = 0
    @bye_limit = bye_limit
    @grandma_says = {  speakup:    "HUH?! SPEAK UP, SONNY!",
                       cash:       "STASH THE CASH IN THE COOKIE JAR!",
                       notsince:   "NO, NOT SINCE",
                       visitsoon:  "COME BACK AND VISIT SOON.",
                       nothing:    "" }
  end
  
  def answers sonny
    return @grandma_says[:nothing] if bye_limit?
    
    if yelling_bye? sonny
      @bye_count += 1
      if bye_limit?
        return @grandma_says[:visitsoon]
      else
        return @grandma_says[:speakup]
      end
    else
      @bye_count = 0
    end
 
    if talking_money? sonny
      @bye_count = 0
      return @grandma_says[:cash]
    end
    
    if yelling? sonny
      @bye_count = 0
      return @grandma_says[:notsince] + " #{ remembers }!"
    end
    @grandma_says[:speakup]
  end
  
  def yelling? string
    string == string.upcase if string =~ /[a-z]|[A-Z]/
  end
  
  def yelling_bye? string
    # only if single BYE, others false.
    return unless yelling?(string)
    return unless (string =~ /(BYE)/ )
    string.index('BYE') == string.rindex('BYE')
  end
  
  def talking_money? string
    string =~ /\$\d+/
  end
  
  def remembers
    (1930..1950).to_a.sample
  end
  
  def visit_again num
    # can initialize be called as a normal method or is t special?
    initialize num
    #@bye_count = 0
    #@bye_limit = num
  end
  
  def bye_limit?
    @bye_count >= @bye_limit
  end
  
end