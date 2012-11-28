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
    
    it "should get the letter below the given letter" do
      key_phrase = "playfair example"
      @pf.set_key_phrase key_phrase
      @pf.get_below("A").should eq("E")
      @pf.get_below("P").should eq("I")
      @pf.get_below("F").should eq("M")
      @pf.get_below("S").should eq("Z")
      @pf.get_below("T").should eq("P")
      @pf.get_below("U").should eq("L")
      @pf.get_below("V").should eq("A")
      @pf.get_below("W").should eq("Y")
      @pf.get_below("Z").should eq("F")
    end
    
    it "should get the letter to the right of given letter" do
      key_phrase = "playfair example"
      @pf.set_key_phrase key_phrase
      @pf.get_right("A").should eq("Y")
      @pf.get_right("F").should eq("P")
      @pf.get_right("M").should eq("I")
      @pf.get_right("S").should eq("K")
      @pf.get_right("Z").should eq("T")
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
    
  end

  context "Encode message" do
    it "correctly for known example" do
      pending "Not started yet"
      key_phrase = "playfair example"
      plain_message = "Hide the gold in the tree stump."
      @pf.encode_message(plain_message).should eq("BM OD ZB XD NA BE KU DM UI XM MO UV IF")
    end
  end

  context "Decode message" do
    it "correctly for known example" do
      pending "Not started yet"
      key_phrase = "playfair example"
      coded_message = "BM OD ZB XD NA BE KU DM UI XM MO UV IF"
      @pf.decode_message(coded_message).should eq("Hidethegoldinthetreestump")
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
