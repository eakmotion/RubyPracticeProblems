# Write calculations using functions and get the results.
# Let's have a look at some examples:

# seven(times(five)) # must return 35
# four(plus(nine)) # must return 13
# eight(minus(three)) # must return 5
# six(divided_by(two)) # must return 3

require 'spec_helper'

class Object
  %w[zero one two three four five six seven eight nine].each_with_index do |name, n|
    define_method(name) do |args = nil|
      args ? n.send(*args) : n.to_f
    end
  end

  %w[plus + minus - times * divided_by /].each_slice(2) do |name, symbol|
    define_method(name) do |n|
      [symbol, n]
    end
  end
end

RSpec.describe "Calculations" do
  it "Example cases" do
    expect(seven(times(five()))).to eq(35)
    expect(four(plus(nine()))).to eq(13)
    expect(eight(minus(three()))).to eq(5)
    expect(six(divided_by(two()))).to eq(3)
  end
end
