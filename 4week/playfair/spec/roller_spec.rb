require File.expand_path('../../lib/roller', __FILE__)

describe Roller do
  before :each do
    @roll = Roller.new(["A", "B", "C", "D"])
  end
  it "should return an array of all the items" do
    @roll.all.should == ["A", "B", "C", "D"]
  end

  it "should return the current item" do
    @roll.current.should == "D"
    @roll.next.should == "A"
    @roll.current.should == "A"
    end  
  
  it "should return the next item" do
    @roll.next.should == "A"
    @roll.next.should == "B"
    @roll.next.should == "C"
    @roll.next.should == "D"
    @roll.next.should == "A"
  end

  it "should reset so that next retrieves the first item" do
    @roll.next.should == "A"
    @roll.next.should == "B"
    @roll.next.should == "C"
    @roll.reset
    @roll.next.should == "A"
  end
end
