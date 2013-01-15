require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/matchers'
MiniTest::Reporters.use!(MiniTest::Reporters::SpecReporter.new)

require './grandma'

describe Grandma do
  before :each do
    @granny = Grandma.new()
  end

  it "should respond with  respond with HUH?! SPEAK UP, SONNY! if you didn't shout" do
    sonny = "something with lowercase letters AND UPPERCASE LETTERS"
    @granny.answers(sonny).must_equal "HUH?! SPEAK UP, SONNY!"
  end
end
