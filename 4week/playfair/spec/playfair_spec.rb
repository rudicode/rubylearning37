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

  context "Create Cipher Square" do
    it "should match known example 'playfair example'" do
      key_phrase = "playfair example"
      given_square = "PLAYFIREXMBCDGHKNOQSTUVWZ"
      @pf.create_cipher_square(key_phrase).should eq(given_square)
    end

    it "should match known example 'First Amendment'" do
      key_phrase = "First Amendment"
      given_square = "FIRSTAMENDBCGHKLOPQUVWXYZ"
      @pf.create_cipher_square(key_phrase).should eq(given_square)
    end

    it "with blank key_phrase should match known example" do
      key_phrase = ""
      blank_square = "ABCDEFGHIKLMNOPQRSTUVWXYZ"
      @pf.create_cipher_square(key_phrase).should eq(blank_square)
    end

    it "should return formated version of cipher_square" do
      cipher_square = "PLAYFIREXMBCDGHKNOQSTUVWZ"
      given_square = "P L A Y F \nI R E X M \nB C D G H \nK N O Q S \nT U V W Z "
      @pf.format_cipher_square(cipher_square).should eq(given_square)
    end

    it "should return formated version of cipher_square for 'I Love Ruby.'" do
      key_phrase = "I Love Ruby."
      given_square = "I L O V E \nR U B Y A \nC D F G H \nK M N P Q \nS T W X Z "
      cipher_square = @pf.create_cipher_square(key_phrase)
      @pf.format_cipher_square(cipher_square).should eq(given_square)
    end

    it "test of sanitize string" do
      @pf.sanitize("  a the  z BBB ").should eq("ATHEZBBB")
      @pf.sanitize('  #$%the ').should eq("THE")
      @pf.sanitize('~~@$%^^&&4355467').should eq("")
    end
  end

end
