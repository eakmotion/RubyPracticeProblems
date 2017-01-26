require 'spec_helper'

def permutation?(a, b)
  return true if b.empty?
  return false if a.size < b.size
  a_list = a.split("")
  b_list = b.split("")
  b_list.each do |i|
    return a_list.include?(i)
  end
end

RSpec.describe "is_permutation" do
  it "return true if B is a blank" do
    expect(permutation?("abc", "")).to be true
  end

  it "return false if B is not a single element of A" do
    expect(permutation?("abc", "d")).to be false
  end

  it "return true if B is a single element of A" do
    expect(permutation?("abc", "ac")).to be true
    expect(permutation?("abcba", "aba")).to be true
  end
end
