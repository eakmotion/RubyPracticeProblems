# Write a function that receives two strings and returns n,
# where n is equal to the number of characters we should shift
# the first string forward to match the second.

# If the second string isn't a valid rotation of the first string,
# the method returns -1.

# Examples:
# "coffee", "eecoff" => 2
# "moose", "Moose" => -1

require 'spec_helper'

def shifted_diff(first, second)
  first.size==second.size&&(second*2).index(first) || -1
end

describe 'shifted_diff' do
  it 'Example cases' do
    expect(shifted_diff("eecoff","coffee")).to eq(4)
    expect(shifted_diff("Moose","moose")).to eq(-1)
    expect(shifted_diff("isn't","'tisn")).to eq(2)
  end
end
