require File.expand_path('../../rectangle', __FILE__)

describe "Rectangle" do
  before :each do
    @rectangle = Rectangle.new(23.45, 34.67)
    @rectangle2 = Rectangle.new(2, 3)
  end
  it "should calculate area" do
    @rectangle.area.should be_within(0.0001).of(813.0115)
    @rectangle2.area.should be_within(0.0001).of(6.0)
  end
  
  it "should calculate perimeter" do
    @rectangle.perimeter.should be_within(0.0001).of(116.24)
    @rectangle2.perimeter.should be_within(0.0001).of(10.0)
  end
  
end
