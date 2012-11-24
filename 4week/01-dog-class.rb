class Dog
  
  attr_reader :name
  
  def initialize name
    @name = name
  end
  def bark
    "Bark!"
  end
  
  def eat
    "Mmm, eat Scooby snacks!"
  end
  
  def chase_cat
    "Chase that cat!"
  end
end
