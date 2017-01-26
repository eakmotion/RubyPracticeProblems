# Expanded Form

require 'spec_helper'
require 'byebug'

def expanded_form(num)
  num_list = num.to_s.split('').reverse
  num_list.map.with_index { |v, i| v.to_i * 10**i }.reject(&:zero?).reverse.join(' + ')
end

RSpec.describe "expanded_form" do
  it "Example cases" do
    expect(expanded_form(12)).to eq("10 + 2")
    expect(expanded_form(42)).to eq("40 + 2")
    expect(expanded_form(7034)).to eq("7000 + 30 + 4")
  end
end
