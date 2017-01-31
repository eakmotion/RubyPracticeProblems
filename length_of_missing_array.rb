# You have to write a method, that return the length of the missing array.

require 'spec_helper'

def getLengthOfMissingArray(a)
  a.any?(&:empty?)?0:(x=a.map(&:size);(Range.new(*x.minmax).to_a-x).first)rescue 0
end

describe "getLengthOfMissingArray" do
  it "Example cases" do
    expect(getLengthOfMissingArray([ [ 1, 2 ], [ 4, 5, 1, 1 ], [ 1 ], [ 5, 6, 7, 8, 9 ] ])).to eq(3)
    expect(getLengthOfMissingArray([ [ 5, 2, 9 ], [ 4, 5, 1, 1 ], [ 1 ], [ 5, 6, 7, 8, 9 ] ])).to eq(2)
    expect(getLengthOfMissingArray([ [ false ], [ false, false, false ] ])).to eq(2)
    expect(getLengthOfMissingArray([ [ 'a', 'a', 'a' ], [ 'a', 'a' ], [ 'a', 'a', 'a', 'a' ], [ 'a' ], [ 'a', 'a', 'a', 'a', 'a', 'a' ] ])).to eq(5)
    expect(getLengthOfMissingArray([ [ 5, 2, 9 ], [ 4, 5, 1, 1 ], [ 1 ], [ 5, 6, 7, 8, 9 ] ])).to eq(2)
    expect(getLengthOfMissingArray([ ])).to eq(0)
  end
end
