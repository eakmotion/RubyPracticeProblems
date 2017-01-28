# Write a function to balance the books

require 'spec_helper'

def split_the_bill(group)
  # (x..y).reduce(:+) combines all elements of enum by applying a binary operation
  # (x).fdiv(y) performs division and returns the value as a float
  # (x.yyyy).round(2) #=> x.yy rounds float to a given precision in decimal digits
  group_average = group.values.reduce(:+).fdiv(group.size)
  group.map { |k,v| [k, (v - group_average).round(2)] }.to_h
end

RSpec.describe "split_the_bill" do
  it "Example cases" do
    expect(split_the_bill({'A'=>20, 'B'=>15, 'C'=>10})).to eq({'A'=>5.00, 'B'=>0.00, 'C'=>-5.00})
    expect(split_the_bill({'A'=>40, 'B'=>25, 'X'=>10})).to eq({'A'=>15.00, 'B'=>0.00, 'X'=>-15.00})
    expect(split_the_bill({'A'=>40, 'B'=>25, 'C'=>10, 'D'=>153, 'E'=>58})).to eq({'A'=>-17.20, 'B'=>-32.20, 'C'=>-47.20, 'D'=>95.80, 'E'=>0.80})
    expect(split_the_bill({'A'=>475, 'B'=>384, 'C'=>223, 'D'=>111, 'E'=>19})).to eq({'A'=>232.6, 'B'=>141.6, 'C'=>-19.4, 'D'=>-131.4, 'E'=>-223.4})
    expect(split_the_bill({'A'=>20348, 'B'=>493045, 'C'=>2948, 'D'=>139847, 'E'=>48937534, 'F'=>1938724, 'G'=>4, 'H'=>2084})).to eq({'A'=>-6421468.75, 'B'=>-5948771.75, 'C'=>-6438868.75, 'D'=>-6301969.75, 'E'=>42495717.25, 'F'=>-4503092.75, 'G'=>-6441812.75, 'H'=>-6439732.75})
  end
end
