# Return a string t having the following property:
#
# length t(O) <= length t(1) >= length t(2) <= length t(3) >= length t(4) .... (P)
#
# where the t(i) are the substring of s; you must respect the following rule:
#
# at each step from left to right, you can only move either already consecutive
# strings or strings that became consecutive after a previous move.
# The number of moves should be minimum.

require "spec_helper"

def arrange(strng)
  array = strng.split(' ')
  0.upto(array.length - 1) do |i|
    array[i, 2] = array[i, 2].sort {|w1,w2| i.even? ? w1.length <=> w2.length : w2.length <=> w1.length}
  end
  result = array.each_index.map {|i| i.odd? ? array[i].upcase : array[i].downcase}
  result.join(' ')
end

RSpec.describe "arrange" do
  it "Example cases" do
    expect(arrange("who hit retaining The That a we taken")).to eq("who RETAINING hit THAT a THE we TAKEN")
    expect(arrange("on I came up were so grandmothers")).to eq("i CAME on WERE up GRANDMOTHERS so")
    expect(arrange("way the my wall them him")).to eq("way THE my WALL him THEM")
    expect(arrange("turn know great-aunts aunt look A to back")).to eq("turn GREAT-AUNTS know AUNT a LOOK to BACK")
  end
end
