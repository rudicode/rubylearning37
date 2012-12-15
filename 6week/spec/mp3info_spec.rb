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

  describe "Invalid TAG info" do
    before :each do
      @valid_tag_info   = Mp3Info.new(@valid_tag)
      @invalid_tag_info = Mp3Info.new(@invalid_tag)
    end
    it "Only responds to valid TAG info" do
      @valid_tag_info.valid?.must_equal true
      @invalid_tag_info.valid?.must_equal false
    end

    it "an invalid TAG clears all previous attributes" do
      @tag_info   = Mp3Info.new(@valid_tag)
      data = @tag_info.all
      data[:title].wont_be_nil
      data[:artist].wont_be_nil

      @tag_info.get_info @invalid_tag

      data = @tag_info.all
      data[:title].must_be_nil
      data[:artist].must_be_nil
    end
     
  end
  
  describe "with valid TAG" do
    before :each do
      @tag_info = Mp3Info.new(@valid_tag) 
      @tag = @tag_info.all
    end
    
    it "Sets the correct header" do
      @tag_info.header.must_equal 'TAG'
    end
    
    it "Sets the correct Title" do
      @tag_info.title.must_equal 'Dancing Shoes'
    end
    
    it "Sets the correct Artist" do
      @tag_info.artist.must_equal 'Cliff Richard and The Shadows'
    end
    
    it "Sets the correct Album" do
      @tag_info.album.must_equal '(SUMMER HOLIDAY  1963)'
    end

    it "Sets the correct Year"do
      @tag_info.year.must_equal '2000'
    end

    it "Sets the correct Comment"do
      @tag_info.comment.must_equal '#100%-Free-MP3s(Dalnet) Anni'
    end

    it "Sets the correct Track"do
      @tag_info.track.must_equal 13
    end

    it "Sets the correct Genre"do
      @tag_info.genre.must_equal 24
    end

    it "Sets track to 0 if there is no track info" do
      tag_with_no_track = Mp3Info.new(@valid_tag_no_track)
      tag_with_no_track.track.must_equal 0
    end

  end

end

