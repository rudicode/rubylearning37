require 'minitest/autorun'
require_relative('../show-new-files')

describe "usage shows usage hints" do
  it "should contain" do
    usage("test").must_include "FILE"
  end

  it "should have one ARGV argument"

end

