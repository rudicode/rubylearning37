require File.expand_path('../../grandma', __FILE__)

describe "Grandma" do
  before :each do
    @grandma = Grandma.new()
  end
  it "should answer for non-yelling 'SPEAK UP'" do
    @grandma.answers("sdfgdfg").should include("SPEAK UP")    
  end

  it "should answer for YELLING 'NO, NOT SINCE'" do
    @grandma.answers("I AM YELLING").should include("NO, NOT SINCE")    
  end

  it "should answer for if bye_limit reached 'COME VISIT SOON.'" do
    @grandma.bye_count = 0
    @grandma.answers("I AM YELLING").should_not include("COME VISIT SOON.")
    @grandma.bye_count = 3
    @grandma.answers("I AM YELLING").should include("COME VISIT SOON.")
  end

  it "should check if yelling" do
    @grandma.yelling?("Hi There").should be_false
    @grandma.yelling?("HI THERE!").should be_true
  end
  
  it "should check if talking about money" do
    @grandma.talking_money?("Hi There").should be_false
    @grandma.talking_money?("Hi There $67.45").should be_true
  end
  
  it "should remember a year between 1930 and 1950" do
    @grandma.remembers.should be_between(1930, 1950)
  end
  
  it "should count number of consecutive BYEs" do
    @grandma.answers "BYE"
    @grandma.bye_count.should eq(1)
  end
  it "should not add to count if sonny says 'BYEBYEBYE or BYE BYE BYE"
  it "should exit after three consecutive BYE"
end
