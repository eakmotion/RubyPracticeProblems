# Return a number from a string

require 'spec_helper'

def filter_string(string)
  string.delete("^0-9").to_i
end

RSpec.describe "filter_string" do
  it "Example cases" do
    expect(filter_string("123")).to eq(123)
    expect(filter_string("a1b2c3")).to eq(123)
    expect(filter_string("aa1bb2cc3dd")).to eq(123)
    expect(filter_string("aa 112 3dd")).to eq(1123)
    expect(filter_string("11bb2c23c3")).to eq(112233)
  end
end
