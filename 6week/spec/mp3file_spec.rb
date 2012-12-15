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

require('./lib/mp3file')

describe "Mp3File" do

  before :each do
    # 
  end
  it "Correctly handles invalid file name" do
    filename = "some_file_that_doesnt_exsist"
    Mp3File.get_tag(filename).must_be_nil
  end
  it ".get_tag returns the last 128 bytes of the file"do
    filename = './spec/data/song.mp3' 
    File.exist?(filename).must_equal true # mp3 file not checked into version control

    data = Mp3File.get_tag(filename)
    data.length.must_equal 128
  end
end

