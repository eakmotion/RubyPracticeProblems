# Find out which one of the given numbers differs from the others
# Indexes of the elements start from 1 (not 0)

# Examples :
# iq_test("2 4 7 8 10") => 3 // Third number is odd, while the rest of the numbers are even
#
# iq_test("1 2 1 1") => 2 // Second number is even, while the rest of the numbers are odd

require 'spec_helper'

def iq_test(numbers)
  nums = numbers.split.map(&:to_i).map(&:even?)
  nums.count(true) > 1 ? nums.index(false) + 1 : nums.index(true) + 1
end

describe 'iq_test' do
  it 'Example cases' do
    expect(iq_test("2 4 7 8 10")).to eq(3)
    expect(iq_test("1 2 2")).to eq(1)
  end
end
