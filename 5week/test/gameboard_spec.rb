require 'minitest/autorun'
require 'minitest/reporters'

reporters = [ MiniTest::Reporters::DefaultReporter.new,
              MiniTest::Reporters::SpecReporter.new, 
              MiniTest::Reporters::ProgressReporter.new,
              # MiniTest::Reporters::RubyMineReporter.new,
              # MiniTest::Reporters::RubyMateReporter.new,
              # MiniTest::Reporters::GuardReporter.new,
              ]
MiniTest::Reporters.use! [reporters[0]]

require './lib/gameboard'

describe "GameBoard: " do
  before :each do
    @gb = GameBoard.new
    locations = [2,3,4]
    @gb.set_locations_cells(locations)
  end
  it "should contain" do
    @gb = GameBoard.new
  end

  it "should report misses" do
    @gb.check_yourself(0).must_equal "Miss"
    @gb.check_yourself(1).must_equal "Miss"
    @gb.check_yourself(5).must_equal "Miss"
    @gb.check_yourself(6).must_equal "Miss"
  end
  it "should report hits" do
    @gb.check_yourself(2).must_equal "Hit"
    @gb.check_yourself(3).must_equal "Hit"
  end
  it "should miss if same target is called" do
    @gb.check_yourself(2).must_equal "Hit"
    @gb.check_yourself(2).must_equal "Miss"
  end
  it "should end the game when locations are empty" do
    @gb.check_yourself(2).must_equal "Hit"
    @gb.check_yourself(3).must_equal "Hit"
    @gb.check_yourself(4).must_equal "kill"
  end
end

describe "Gameboard ready for client upgrades" do
  before :each do
    @gb = GameBoard.new
    locations = [2,3,4]
    @gb.set_locations_cells(locations)
  end

  it "should work with larger playing field"
  it "should work with non-sequntial targets"
  it "should work with string targets"

end

