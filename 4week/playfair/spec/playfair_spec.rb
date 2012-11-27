require File.expand_path('../../playfair', __FILE__)

describe Playfair do
  before :each do
    @pf = Playfair.new()
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

    it "should be 25 characters in length" do
      key_phrase = "playfair example"
      given_string = "PLAYFIREXMBCDGHKNOQSTUVWZ"
      @pf.set_key_phrase key_phrase
      @pf.cipher_string.length.should eq(25)
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

  it "test of sanitize string" do
    @pf.sanitize("  a the  z BBB ").should eq("ATHEZBBB")
    @pf.sanitize('  #$%the ').should eq("THE")
    @pf.sanitize('~~@$%^^&&4355467').should eq("")
  end


end
