# Task1: Write a function split. Split 2D array to two arrays
# Task2: Write a function join. Join two array to one array

require 'spec_helper'
require 'byebug'

def split(arr)
  [arr.flatten, arr.map { |a| [a.length] }]
end

def join(arr1, arr2)
  arr2.map { |(n)| arr1.shift(n) }
end

RSpec.describe "Example cases" do
  it "testing split" do
    split_tests = [
      [
        [[1],[2,3],[4,5,6],[7,8,9,10],[11]],
        [[1,2,3,4,5,6,7,8,9,10,11], [[1],[2],[3],[4],[1]]]
      ],
      [
        [[1,3,5],[2,4,6],[7,8,9],[10]],
        [[1,3,5,2,4,6,7,8,9,10], [[3],[3],[3],[1]]]
      ]
    ]
    split_tests.each { | i, e |
      expect(split(i)).to eq(e)
    }
  end

  it "testing join" do
    join_tests = [
      [
        [1,2,3,4,5,6,7,8,9,10],
        [[1],[2],[3],[4]],
        [[1],[2,3],[4,5,6],[7,8,9,10]]
      ],
      [
        [1,3,5,2,4,6,7,8,9],
        [[3],[3],[3]],
        [[1,3,5],[2,4,6],[7,8,9]]
      ]
    ]
    join_tests.each { | arr1, arr2, e |
      expect(join(arr1, arr2)).to eq(e)
    }
  end
end
