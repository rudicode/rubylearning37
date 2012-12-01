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
    "Get that cat!"
  end

  def chase_cat
    def distance
      distance = rand(11)
    end
    until distance == 0
      str = @name + "-" * distance + "cat   "
      print str
    end
    puts "MIAAAAUUW"
  end

  def teach_trick(sym,&block) 
    #return if self.respond_to? sym
    define_singleton_method(sym) do
    instance_eval &block
    end
  end  
  
  def method_missing(m,*args,&block)
    "#{@name} doesn't know how to #{m}"
  end
  
end


