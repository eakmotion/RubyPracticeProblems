# Create a simple calculator that given a string of operators (+ - * and /)
# and numbers separated by spaces returns the value of that expression

require 'spec_helper'

class Calculator
  def evaluate(string)
    [' + ', ' - ', ' * ', ' / '].each do |op|
      if string.include?(op)
        return string.split(op).map { |s| evaluate(s) }.inject(op.strip)
      end
    end
    string.to_f
  end
end

RSpec.describe "evaluate" do
  it "Example cases" do
    expect(Calculator.new.evaluate("2 / 2 + 3 * 4 - 6")).to eq(7)
  end
end
