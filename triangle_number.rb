# A triangle number is a number where n objects form an equilateral triangle
# For example, 6 is a triangle number because you can arrange 6 objects into
# an equilateral triangle:

#   1
#  2 3
# 4 5 6

# 8 is not a triangle number because 8 objects do not form an equilateral triangle:

#    1
#   2 3
#  4 5 6
# 7 8

require "spec_helper"

def isTriangleNumber(number)
  (number.is_a? Integer) ? (((-1 + Math.sqrt(1 + 8 * number)) / 2) % 1) == 0 : false
end

RSpec.describe "isTriangleNumber" do
  it "Example cases" do
    expect(isTriangleNumber(3)).to be true
    expect(isTriangleNumber(6)).to be true
    expect(isTriangleNumber(5)).to be false
    expect(isTriangleNumber("hello")).to be false
    expect(isTriangleNumber(6.15)).to be false
  end
end
