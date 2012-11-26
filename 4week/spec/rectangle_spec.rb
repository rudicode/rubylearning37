require File.expand_path('../../rectangle', __FILE__)

describe "Rectangle" do
  before :each do
    @rectangle1 = Rectangle.new(23.45, 34.67)
    @rectangle2 = Rectangle.new(2, 3)
    @precision = 0.000001
  end
  it "should calculate area" do
    @rectangle1.area.should be_within(@precision).of(813.0115)
    @rectangle2.area.should be_within(@precision).of(6.0)
  end

  it "should calculate perimeter" do
    @rectangle1.perimeter.should be_within(@precision).of(116.24)
    @rectangle2.perimeter.should be_within(@precision).of(10.0)
  end

  it "should set a new length and re-calculate automaticaly" do
    @rectangle2.length = 4.0
    @rectangle2.area.should      be_within(@precision).of(12.0)
    @rectangle2.perimeter.should be_within(@precision).of(14.0)
  end

  it "should set a new width and re-calculate automaticaly" do
    @rectangle2.width = 4.0
    @rectangle2.area.should      be_within(@precision).of(8.0)
    @rectangle2.perimeter.should be_within(@precision).of(12.0)
  end

    it "should update both length and width, and re-calculate automaticaly" do
    @rectangle2.update(2.5, 4.5)
    @rectangle2.area.should      be_within(@precision).of(11.25)
    @rectangle2.perimeter.should be_within(@precision).of(14.0)
  end

end
