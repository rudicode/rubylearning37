require File.expand_path('../analyzer', __FILE__)

paragraphs_3 = "Hi\r\n\r\nThere\n\nHow are you\n"

paragraphs_4 = "Hi\n\n\nThere\n\n\n\How are you\n\n\nDonig today?\n"

sentences = "Hello there. How are you doing? Thats fantastic!\n"

line = "For a long time after it was ushered into this world of sorrow\n"

simple_line = "abcd efg!\n"



describe "Analyzer" do
  it "should count characters, per line" do
    count_characters(simple_line).should eq(9)
  end

  it "should count characters without whitespace, per line" do
    count_characters_no_whitespace(simple_line).should eq(8)
  end

  it "should count words per line" do
    count_words(simple_line).should eq(2)
    count_words(line).should eq(13)
  end

  it "should count sentences per line" do
    count_sentences(simple_line).should eq(1)
    count_sentences(sentences).should eq(3)
    count_sentences(line).should eq(0)
  end

  describe "should count paragraphs per line" do

    it "where \\n\\n is one paragraph" do
      number_of_paragraphs = 1
      paragraphs_3.each_line do |line|
        number_of_paragraphs += count_paragraphs(line)
      end
      number_of_paragraphs.should eq(3)
    end

      it "where \\n\\n\\n is one paragraph" do
      number_of_paragraphs = 1
      paragraphs_4.each_line do |line|
        number_of_paragraphs += count_paragraphs(line)
      end
      number_of_paragraphs.should eq(4)
    end

    it "where there are 18 paragraphs in text.txt" do
      text_txt = IO.read("text.txt")
      number_of_paragraphs = 1
      text_txt.each_line do |line|
        number_of_paragraphs += count_paragraphs(line)
      end
      number_of_paragraphs.should eq(18)
    end
  end
end
