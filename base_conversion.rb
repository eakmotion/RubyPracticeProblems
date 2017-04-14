# Implement a base converter, which converts between arbitrary bases / alphabets.

# The function convert() should take an input (string),
# the source alphabet (string) and the target alphabet (string).
# You can assume that the input value always consists of characters from
# the source alphabet. You don't need to validate it.

require "spec_helper"

def convert(input, source, target)
  value = input.chars.reduce(0) do |s, c|
    source.size * s + source.index(c)
  end
  res = ''
  while value >= 0
    res = target[value % target.size] + res
    value = value < target.size ? -1 : value/target.size
  end
  res
end

RSpec.describe "convert" do
  bin='01'
  oct='01234567'
  dec='0123456789'
  hex='0123456789abcdef'
  allow='abcdefghijklmnopqrstuvwxyz'
  alup='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  alpha='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  alphanum='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

  it "Basic purely numeric tests" do
    expect(convert("15", dec, bin)).to eq("1111")
    expect(convert("15", dec, oct)).to eq("17")
    expect(convert("1010", bin, dec)).to eq("10")
    expect(convert("1010", bin, hex)).to eq("a")
  end

  it "Basic alphanumeric tests" do
    expect(convert("0", dec, alpha)).to eq("a")
    expect(convert("27", dec, allow)).to eq("bb")
    expect(convert("hello", allow, hex)).to eq("320048")
    expect(convert("SAME", alup, alup)).to eq("SAME")
  end
end
