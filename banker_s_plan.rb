# Build a function fortune which returns true if John can make a living
# for n years and false if it is not possible.

# John has some amount of money of which he wants to deposit a part f0
# to the bank at the beginning of year 1. He wants to withdraw each year
# for his living an amount c0.

# Example

# f0 = 100000, p = 1 percent, c0 = 2000, n = 15, i = 1 percent
# beginning of year 2 -> f1 = 100000 + 0.01*100000 - 2000 = 99000; c1 = c0 + c0*0.01 = 2020 (with inflation of previous year)
# beginning of year 3 -> f2 = 99000 + 0.01*99000 - 2020 = 97970; c2 = c1 + c1*0.01 = 2040.20 (with inflation of previous year, truncated to 2040)
# and so on...

require "spec_helper"

def fortune(f0, p, c0, n, i)
  p /= 100.0
  i /= 100.0
  (n - 1).times do
    f0 += (f0 * p - c0).floor
    c0 += (c0 * i).floor
  end
  f0 > 0
end

RSpec.describe "fortune" do
  it "Example cases" do
    expect(fortune(100000, 1, 2000, 15, 1)).to eq(true)
    expect(fortune(100000, 1, 9185, 12, 1)).to eq(false)
    expect(fortune(100000000, 1, 100000, 50, 1)).to eq(true)
    expect(fortune(100000000, 1.5, 10000000, 50, 1)).to eq(false)
    expect(fortune(100000000, 5, 1000000, 50, 1)).to eq(true)
  end
end
