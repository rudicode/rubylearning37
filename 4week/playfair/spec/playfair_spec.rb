require File.expand_path('../../playfair', __FILE__)

describe Playfair do
  before :each do
    @pf = Playfair.new()
  end

  context "Utility methods: " do
    it "test of sanitize string" do
      @pf.sanitize("  a the  z BBB ").should eq("ATHEZBBB")
      @pf.sanitize('  #$%the ').should eq("THE")
      @pf.sanitize('~~@$%^^&&4355467').should eq("")
    end

    it "should find the correct row and column for a given letter" do
      key_phrase = "playfair example"
      @pf.set_key_phrase key_phrase
      rowcolumn = @pf.find_row_and_column "H"
      rowcolumn.should == [3,5]
      rowcolumn2 = @pf.find_row_and_column "I"
      rowcolumn2.should == [2,1]
      rowcolumn2 = @pf.find_row_and_column "W"
      rowcolumn2.should == [5,4]
    end

    it "should return letter at row, column" do
      key_phrase = "playfair example"
      @pf.set_key_phrase key_phrase
      @pf.letter_at(1,1).should eq("P")
      @pf.letter_at(1,5).should eq("F")
      @pf.letter_at(3,4).should eq("G")
      @pf.letter_at(5,1).should eq("T")
      @pf.letter_at(5,5).should eq("Z")
    end

    it "should encode given pair" do
      key_phrase = "playfair example"
      @pf.set_key_phrase key_phrase
      @pf.encode_pair("H","I").should eq(["B","M"])
      @pf.encode_pair("D","H").should eq(["G","B"])
      @pf.encode_pair("Z","U").should eq(["T","V"])
      @pf.encode_pair("P","Z").should eq(["F","T"])
      @pf.encode_pair("P","F").should eq(["L","P"])
      @pf.encode_pair("S","Z").should eq(["Z","F"])
    end

    it "should decode given pair" do
      key_phrase = "playfair example"
      @pf.set_key_phrase key_phrase
      @pf.decode_pair("B","M").should eq(["H","I"])
      @pf.decode_pair("G","B").should eq(["D","H"])
      @pf.decode_pair("T","V").should eq(["Z","U"])
      @pf.decode_pair("F","T").should eq(["P","Z"])
      @pf.decode_pair("L","P").should eq(["P","F"])
      @pf.decode_pair("Z","F").should eq(["S","Z"])
    end

    it "should have square return an array of row arrays" do
      key_phrase = "playfair example"
      given_array = [["P", "L", "A", "Y", "F"], ["I", "R", "E", "X", "M"],
                     ["B", "C", "D", "G", "H"], ["K", "N", "O", "Q", "S"],
                     ["T", "U", "V", "W", "Z"]]
      @pf.set_key_phrase key_phrase
      @pf.square.should eq(given_array)
    end

  end

  context "Encode message" do
        
    it "should encrypt know examples" do
      encipher_tests = [ [ "playfair example", "Hide the gold in the tree stump", "BMODZBXDNABEKUDMUIXMMOUVIF" ],
                 [ "battlestar galactica", "Galactica, this is boomer.  There are four cylon base-stars around the third moon!", "RTETGLSITLMGRSDSPWUFAIGPAIBTIAOWOIKLAQVSBRBILTGRRFPNVNGPBLMGSFFUPO" ],
                 #['RubyLearning.com', 'Weeee LOOOOVE Ruuuuby!', "TNITGTGRDVFVDVKUCEYVLVYVBYIY"]
                 ]
      encipher_tests.each do |key_phrase, plain_message, expected_cipher_text|
        @pf.set_key_phrase key_phrase
        @pf.encode_message(plain_message).should eq(expected_cipher_text)
      end
    end
    
  end

  context "Decode message" do
    it "correctly for known example" do
      #pending "Not started yet"
      key_phrase = "playfair example"
      coded_message = "BMODZBXDNABEKUDMUIXMMOUVIF"
      known_plain = "HIDETHEGOLDINTHETREXESTUMP"
      @pf.set_key_phrase key_phrase
      @pf.decode_message(coded_message).should eq(known_plain)
    end
  end

  context "Cipher String" do
    it "should match known example 'playfair example'" do
      key_phrase = "playfair example"
      given_string = "PLAYFIREXMBCDGHKNOQSTUVWZ"
      @pf.set_key_phrase key_phrase
      @pf.cipher_string.should eq(given_string)
    end

    it "should match known example 'First Amendment'" do
      key_phrase = "First Amendment"
      given_string = "FIRSTAMENDBCGHKLOPQUVWXYZ"
      @pf.set_key_phrase key_phrase
      @pf.cipher_string.should eq(given_string)
    end

    it "should match known example with blank key_phrase" do
      key_phrase = ""
      given_string = "ABCDEFGHIKLMNOPQRSTUVWXYZ"
      @pf.set_key_phrase key_phrase
      @pf.cipher_string.should eq(given_string)
    end

    it "should match known example 'Japan'" do
      key_phrase = "Japan"
      given_string = "IAPNBCDEFGHKLMOQRSTUVWXYZ"
      @pf.set_key_phrase key_phrase
      @pf.cipher_string.should eq(given_string)
    end
    
    

    it "should be 25 characters in length" do
      key_phrase = "playfair example that HAS an extremly long key_phrase \
                   ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
      given_string = "PLAYFIREXMTHSNOGKBCDQUVWZ"
      @pf.set_key_phrase key_phrase
      @pf.cipher_string.length.should eq(25)
      @pf.cipher_string.should eq(given_string)
    end
  end

  context "Cipher Square" do

    it "should return formated version of cipher_square for 'playfair example'" do
      key_phrase = "playfair example"
      given_square = "P L A Y F \nI R E X M \nB C D G H \nK N O Q S \nT U V W Z "
      @pf.set_key_phrase key_phrase
      @pf.cipher_square.should eq(given_square)
    end

    it "should return formated version of cipher_square for 'I Love Ruby.'" do
      key_phrase = "I Love Ruby."
      given_square = "I L O V E \nR U B Y A \nC D F G H \nK M N P Q \nS T W X Z "
      @pf.set_key_phrase key_phrase
      @pf.cipher_square.should eq(given_square)
    end
  end

  context "Prepare Plain Message" do

    it "should format message 'Hide the gold in the tree stump'" do
      plain_message = "Hide the gold in the tree stump"
      message_string = "HIDETHEGOLDINTHETREXESTUMP"
      @pf.format_message(plain_message).should eq(message_string)
    end

    it "should format message 'Congress shall ball'" do
      plain_message = "Congress shall ball"
      message_string = "CONGRESXSZSHALLBALLX"
      @pf.format_message(plain_message).should eq(message_string)
    end
    

  end
end
