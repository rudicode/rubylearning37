require File.expand_path('../../grandma', __FILE__)

describe "Grandma" do
  before :each do
    @grandma = Grandma.new(3)
  end
  
  describe "answer" do

    it "should answer for non-yelling 'SPEAK UP'" do
      @grandma.answers("sdfgdfg").should include("SPEAK UP")    
    end
  
    it "should answer for YELLING 'NO, NOT SINCE'" do
      @grandma.answers("I AM YELLING").should include("NO, NOT SINCE")    
    end

    it "should answer for $45.23 'STASH THE CASH IN THE COOKIE JAR'" do
      @grandma.answers("I AM YELLING $45.23").should include("STASH THE CASH IN THE COOKIE JAR")    
    end

    it "should not add to count if sonny says 'BYEBYEBYE or BYE BYE BYE" do
      start_count = @grandma.bye_count
      @grandma.answers("BYEBYEBYE")
      @grandma.bye_count.should eq(start_count)
      
      @grandma.answers("BYE BYE BYE")
      @grandma.bye_count.should eq(start_count)
      
      @grandma.answers(" BYE")
      @grandma.bye_count.should eq(start_count)

      @grandma.answers("LILLIAN WANTED TO SAY BYE AND SO DID SAID")
      @grandma.bye_count.should eq(start_count)

    end

    describe "After BYE BYE BYE" do
      before :each do
        @grandma.visit_again(3)
        @grandma.answers("BYE")
        @grandma.answers("BYE")
        
      end

      it "should stop talking after three consecutive BYE" do
        @grandma.answers("BYE").should include("COME BACK AND VISIT SOON.")
        @grandma.answers("I AM YELLING").should be_empty
        @grandma.answers("hi there").should be_empty
      end

      it "should start talking again after a new visit (reset)" do
        @grandma.answers("BYE")
        @grandma.answers("talking").should be_empty
        @grandma.visit_again(3)
        @grandma.answers("talking").should include("SPEAK UP")
      end
    end
  end

  it "should check if yelling" do
    @grandma.yelling?("Hi There").should be_false
    @grandma.yelling?("HI THERE!").should be_true
  end
  
    it "should check if yelling_bye" do
    @grandma.yelling_bye?("BYE BYE").should be_false
    @grandma.yelling_bye?("bye").should be_false
    @grandma.yelling_bye?("BYE bye").should be_false
    @grandma.yelling_bye?("BYE").should be_true
  end
  
  it "should check if talking about money" do
    @grandma.talking_money?("Hi There").should be_false
    @grandma.talking_money?("Hi There $67.45").should be_true
  end
  
  it "should remember a year between 1930 and 1950" do
    # TODO: how can we correctly test a method that returns a random?
    @grandma.remembers.should be_between(1930, 1950)
  end

end
