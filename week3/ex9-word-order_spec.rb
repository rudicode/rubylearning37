require File.expand_path('../ex9-word-order', __FILE__)

describe "reverse_words" do
  before :each do
    @original_words = "The ships hung in the sky in much the same way that bricks don't"
    @reverse_order = "don't bricks that way same the much in sky the in hung ships The"
  end

  it "should reverse the word order of the string" do
    reverse_words(@original_words).should eq(@reverse_order)
  end

end
