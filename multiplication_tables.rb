# Create a function that accepts dimensions, of Rows x Columns,
# as parameters in order to create a multiplication table sized according
# to the given dimensions. **The return value of the function must be an array,
# and the numbers must be Fixnums, NOT strings.

require 'spec_helper'

def multiplication_table(row, column)
  (1..row).map { |i|
    (1..column).map { |j| i * j }
  }
end

RSpec.describe "findDuplicates" do
  it "Examples cases" do
    expect(multiplication_table(3,3)).to eq([[1, 2, 3], [2, 4, 6], [3, 6, 9]])
  end
end
