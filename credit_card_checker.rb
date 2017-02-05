# Write a function that checks whether a credit card number is correct or not, using the Luhn algorithm.
# for reference check: https://en.wikipedia.org/wiki/Luhn_algorithm

require "spec_helper"

def valid_card?(card)
  card.scan(/(\d)(\d)/).inject(0) { |memo, (a, b)|
    a = a.to_i * 2
    a -= 9 if a > 9
    memo + a + b.to_i
  } % 10 == 0
end

RSpec.describe "valid_card?" do
  it "Example cases" do
    expect(valid_card?("1234 5678 9012 3452")).to be true
    expect(valid_card?("5555 5555 5555 5555")).to be false
  end
end
