require "rubygems"
require "bundler/setup"
require 'minitest/autorun'
require 'minitest/reporters'

reporters = [ MiniTest::Reporters::DefaultReporter.new,
              MiniTest::Reporters::SpecReporter.new, 
              MiniTest::Reporters::ProgressReporter.new,
              # MiniTest::Reporters::RubyMineReporter.new,
              # MiniTest::Reporters::RubyMateReporter.new,
              MiniTest::Reporters::GuardReporter.new,
              ]
MiniTest::Reporters.use! [reporters[1]]
#MiniTest::Reporters.use! [reporters.sample]

require('./lib/mp3info')

describe "Mp3Info" do
  before :each do
      @valid_tag = "TAGDancing Shoes\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000Cliff Richard and The Shadows\u0000(SUMMER HOLIDAY  1963)\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u00002000#100%-Free-MP3s(Dalnet) Anni\u0000\r\u0018"
      @valid_tag_no_track = "TAGDancing Shoes\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000Cliff Richard and The Shadows\u0000(SUMMER HOLIDAY  1963)\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u00002000#100%-Free-MP3s(Dalnet) Annixx\u0018"
      @invalid_tag = "Dancing Shoes\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000Cliff Richard and The Shadows\u0000(SUMMER HOLIDAY  1963)\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u00002000#100%-Free-MP3s(Dalnet) Anni\u0000\r\u0018"
  end

  describe "TAG info" do
    before :each do
      @valid_tag_info   = Mp3Info.new(@valid_tag)
      @invalid_tag_info = Mp3Info.new(@invalid_tag)
    end
    it "Only responds to valid TAG info" do
      @valid_tag_info.valid?.must_equal true
      @invalid_tag_info.valid?.must_equal false
    end

    it ".valid? must return nil, if tag info is not exactly 128 bytes" do
      temp = Mp3Info.new("TAGshort one")
      temp.valid?.must_equal false

    end

    it "an invalid TAG clears.song previous attributes" do
      @tag_info   = Mp3Info.new(@valid_tag)
      data = @tag_info.song
      data[:title].wont_be_nil
      data[:artist].wont_be_nil

      @tag_info.get_info @invalid_tag

      data = @tag_info.song
      data[:title].must_be_nil
      data[:artist].must_be_nil
    end
     
  end
  
  describe "with valid TAG" do
    before :each do
      @tag_info = Mp3Info.new(@valid_tag) 
    end

    it "must respond to TAG attribute methods" do
      methods = [:title, :header, :artist, :album, :year, :comment, :track ]
      methods.each do |m|
        @tag_info.must_respond_to m
      end
    end
    
    it "wont respond to boo" do
      @tag_info.wont_respond_to :boo
    end
    
    it "Sets the correct mp3info" do
      # pending "Not set up yet"
      correct_info = { 
        header: 'TAG',
        title: 'Dancing Shoes', 
        artist: 'Cliff Richard and The Shadows',
        album: '(SUMMER HOLIDAY  1963)',
        year: '2000',
        comment: '#100%-Free-MP3s(Dalnet) Anni',
        track: 13,
        genre: 24,
        }

      correct_info.each_pair do |m,answer|
        @tag_info.send(m).must_equal answer
      end
    end

    it "Sets track to 0 if there is no track info" do
      tag_with_no_track = Mp3Info.new(@valid_tag_no_track)
      tag_with_no_track.track.must_equal 0
    end

  end

end

