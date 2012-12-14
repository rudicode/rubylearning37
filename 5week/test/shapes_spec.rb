require 'minitest/autorun'
require 'minitest/reporters'

reporters = [ # MiniTest::Reporters::DefaultReporter.new,
              MiniTest::Reporters::SpecReporter.new, 
              # MiniTest::Reporters::ProgressReporter.new,
              # MiniTest::Reporters::RubyMineReporter.new,
              # MiniTest::Reporters::RubyMateReporter.new,
              # MiniTest::Reporters::GuardReporter.new,
              ]
MiniTest::Reporters.use! [reporters.sample]

require('./lib/shapes')

describe "Shape: " do
  before :each do
    @square = Square.new("square")
    @triangle = Triangle.new("triangle")
  end
  
  it "should rotate" do
    @square.rotate.must_include "Square is rotating"
    @triangle.rotate.must_include "Triangle is rotating"
  end
  
  it "should play a sound" do
    @square.play_sound.must_include ".aif"
    @triangle.play_sound.must_include ".aif"
  end
end
