#  Implement an algorithm to determine if a string has all unique characters.

require 'spec_helper'

def unique?(s)
  return true if s.size <= 1
  return s.split('').uniq.size == s.split('').size
end

RSpec.describe "unique?" do
  it "returns true for an empty or one-element string" do
    expect(unique?("")).to be true
    expect(unique?("a")).to be true
  end
  it "returns true for a unique string" do
    expect(unique?("12")).to be true
    expect(unique?("123")).to be true
  end
  it "returns false for a string with dups" do
    expect(unique?("aa")).to be false
    expect(unique?("abacdea")).to be false
  end
  it "properly handles embedded newlines" do
    expect(unique?("abc\n456")).to be true
    expect(unique?("abc\n456c")).to be false
    expect(unique?("abc\n456\n")).to be false
  end
end
