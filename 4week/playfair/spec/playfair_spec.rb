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
      letter_data = [ [1,1,"P"],
                      [1,5,"F"],
                      [3,4,"G"],
                      [5,1,"T"],
                      [5,5,"Z"]]
      
      letter_data.each do |x,y,letter|
        @pf.letter_at(x,y).should eq(letter)
      end
    end

    it "should encode given pair" do
      key_phrase = "playfair example"
      @pf.set_key_phrase key_phrase
      encode_pairs = [["H","I","B","M"],
                      ["D","H","G","B"],
                      ["Z","U","T","V"],
                      ["P","Z","F","T"],
                      ["P","F","L","P"],
                      ["S","Z","Z","F"]]
      
      encode_pairs.each do |a, b, x, y|
        @pf.cipher_pair(a,b).should eq([x,y])
      end
    end

    it "should decode given pair" do
      key_phrase = "playfair example"
      @pf.set_key_phrase key_phrase
      
      decode_pairs = [["B","M","H","I"],
                      ["G","B","D","H"],
                      ["T","V","Z","U"],
                      ["F","T","P","Z"],
                      ["L","P","P","F"],
                      ["Z","F","S","Z"]]
      
      decode_pairs.each do |a, b, x, y|
        @pf.cipher_pair(a,b,"decrypt").should eq([x,y])
      end
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
        @pf.encrypt(plain_message).should eq(expected_cipher_text)
      end
    end
    
  end

  context "Decode message" do
    
    it "correctly for known example" do
      
      decode_test = [
        ["playfair example", "BMODZBXDNABEKUDMUIXMMOUVIF", "HIDETHEGOLDINTHETREXESTUMP"],
        ["playfair example", "BMODZBXDNABEKUDMUIXMMOUVIF", "HIDETHEGOLDINTHETREXESTUMP"],
        ["battlestar galactica", "RTETGLSITLMGRSDSPWUFAIGPAIBTIAOWOIKLAQVSBRBILTGRRFPNVNGPBLMGSFFUPO","GALACTICATHISISBOXOMERTHEREAREFOURCYLONBASESTARSAROUNDTHETHIRDMOON"]
      ]
      decode_test.each do |key_phrase, coded_message, known_plain|
        @pf.set_key_phrase key_phrase
        @pf.decrypt(coded_message).should eq(known_plain)
      end
    end
  end

  context "Cipher String" do
    it "should match known examples" do
      cipher_string_test = [
        ["playfair example", "PLAYFIREXMBCDGHKNOQSTUVWZ"],
        ["First Amendment", "FIRSTAMENDBCGHKLOPQUVWXYZ"],
        ["", "ABCDEFGHIKLMNOPQRSTUVWXYZ"],
        ["Japan", "IAPNBCDEFGHKLMOQRSTUVWXYZ"]
      ]
      cipher_string_test.each do |key_phrase, cipher_string|
        @pf.set_key_phrase key_phrase
        @pf.cipher_string.should eq(cipher_string)
      end
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

    it "should format message correctly" do
    
    format_tests = [
      ["Hide the gold in the tree stump", "HIDETHEGOLDINTHETREXESTUMP"],
      ["Congress shall jail", "CONGRESXSZSHALLIAILX"],
      ["Galactica, this is boomer.  There are four cylon base-stars around the third moon!", "GALACTICATHISISBOXOMERTHEREAREFOURCYLONBASESTARSAROUNDTHETHIRDMOON"]
      ]
      format_tests.each do |plain_message, expected_formated_text|
        @pf.format_message(plain_message).should eq(expected_formated_text)
      end
    
    end  
  end
end
