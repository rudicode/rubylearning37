#require File.expand_path('../ex2', __FILE__)
def insert_word str, find, insert
  output = "#{insert} #{find}"
  str.gsub(/\b#{find}\b/, output)
end

describe "insert_word" do
  before :each do
    #
  end

  it "should insert a word before the match" do
    str = "text foreword text text wordworthy text word"
    expected_str = "text foreword text text wordworthy text inserted word"
    insert_word(str, "word", "inserted").should eq(expected_str)
  end

end
