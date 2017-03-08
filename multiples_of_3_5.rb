# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9. The sum of these multiples is 23.

require 'spec_helper'

def solution(number)
 (1...number).select {|i| i%3==0 || i%5==0}.inject(:+)
end

describe 'solution' do
  it 'Example cases' do
    expect(solution(10)).to eq(23)
    expect(solution(20)).to eq(78)
  end
end
