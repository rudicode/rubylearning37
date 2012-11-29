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
  
  it "should create a method on an individal instance of a dog" do
    other_dog = Dog.new('Lassie')
    other_dog.teach_trick(:jump) { "#{@name} soars into the air!" }
    @my_dog.respond_to?("laugh").should be_false
    @my_dog.teach_trick(:laugh) { "#{@name} finds this hilarious!" }
    @my_dog.respond_to?("laugh").should be_true
    @my_dog.respond_to?("jump").should be_false
    other_dog.respond_to?("laugh").should be_false
    other_dog.respond_to?("jump").should be_true
  end
end
