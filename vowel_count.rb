# Return the number (count) of vowels in the given string.

require 'spec_helper'

def getCount(inputStr)
  inputStr.count('aeiou')
end

describe 'getCount' do
  it 'Example cases' do
    expect(getCount("abracadabra")).to eq(5)
  end
end
