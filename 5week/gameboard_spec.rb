require 'minitest/autorun'
require_relative('gameboard')

describe "GameBoard: " do
  it "should contain" do
    gb = GameBoard.new
    locations = [2,3,4] 
    gb.set_locations_cells(locations).must_equal [2,3,4]
  end

  it "should test answer" do
    gb = GameBoard.new
    locations = [2,3,4]
    gb.set_locations_cells(locations)
    gb.check_yourself(0).must_equal "MISS"
    gb.check_yourself(1).must_equal "MISS"
    gb.check_yourself(5).must_equal "MISS"
    gb.check_yourself(6).must_equal "MISS"
    gb.check_yourself(2).must_equal "HIT"
    gb.check_yourself(3).must_equal "HIT"
    gb.check_yourself(4).must_equal "KILL"
  end

end
