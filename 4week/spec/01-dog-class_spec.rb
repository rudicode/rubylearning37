require File.expand_path('../../01-dog-class', __FILE__)

describe "Dog" do
  before :each do
    @mydog = Dog.new('Scooby')
  end
  it "should bark" do
    @mydog.bark.should eq("Bark!")
  end
  
  it "should eat" do
    @mydog.eat.should eq("Mmm, eat Scooby snacks!")
  end
  
  it "should chase cat" do
    @mydog.chase_cat.should eq("Get that cat!")
  end
  
  it "should have a name" do
    dogname = "Scooby"
    testdog = Dog.new(dogname)
    testdog.name.should eq(dogname)
  end
end
