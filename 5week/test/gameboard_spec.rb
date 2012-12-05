require 'minitest/autorun'
require 'minitest/reporters'

reporters = [ MiniTest::Reporters::DefaultReporter.new,
              MiniTest::Reporters::SpecReporter.new, 
              MiniTest::Reporters::ProgressReporter.new,
              # MiniTest::Reporters::RubyMineReporter.new,
              # MiniTest::Reporters::RubyMateReporter.new,
              # MiniTest::Reporters::GuardReporter.new,
              ]
MiniTest::Reporters.use! [reporters[2]]

require './lib/gameboard'

describe "GameBoard: " do
  it "should contain" do
    gb = GameBoard.new
    locations = [2,3,4] 
    gb.set_locations_cells(locations).must_equal [2,3,4]
  end

  it "should report hits" do
    gb = GameBoard.new
    locations = [2,3,4]
    gb.set_locations_cells(locations)
    gb.check_yourself(0).must_equal "Miss"
    gb.check_yourself(1).must_equal "Miss"
    gb.check_yourself(5).must_equal "Miss"
    gb.check_yourself(6).must_equal "Miss"
    gb.check_yourself(2).must_equal "Hit"
    gb.check_yourself(3).must_equal "Hit"
    gb.check_yourself(4).must_equal "kill"
  end

end
