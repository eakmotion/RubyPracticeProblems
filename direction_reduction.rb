# Write a function dirReduc which will take an array of strings and returns an
# array of strings with the needless directions removed (W<->E or S<->N side by side).

# Examples
# dirReduc(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]) => ["WEST"]
# dirReduc(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH"]) => []

require 'spec_helper'

OPPOSITE = {
  "NORTH" => "SOUTH",
  "SOUTH" => "NORTH",
  "EAST"  => "WEST",
  "WEST"  => "EAST"
}

def dirReduc(arr)
  arr.each_with_object([]) do |dir, stack|
    OPPOSITE[dir] == stack.last ? stack.pop : stack.push(dir)
  end
end

RSpec.describe "dirReduc" do
  it "Example cases" do
    a = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
    u = ["NORTH", "WEST", "SOUTH", "EAST"]
    expect(dirReduc(a)).to eq(["WEST"])
    expect(dirReduc(u)).to eq(["NORTH", "WEST", "SOUTH", "EAST"])
  end
end
