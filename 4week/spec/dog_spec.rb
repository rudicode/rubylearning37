require File.expand_path('../../dog', __FILE__)

describe "Dog" do
  before :each do
    @my_dog = Dog.new('Scooby')
  end
  it "should bark" do
    @my_dog.bark.should eq("Bark!")
  end

  it "should eat" do
    @my_dog.eat.should eq("Mmm, eat Scooby snacks!")
  end

  it "should chase cat" do
    @my_dog.chase_cat.should eq("Get that cat!")
  end

  it "should have a name" do
    @my_dog.name.should eq('Scooby')
  end
end
