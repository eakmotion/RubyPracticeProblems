# Write a function which increments a string, to create a new string.
# If the string already ends with a number, the number should be
# incremented by 1.
# If the string does not end with a number the number 1 should be
# appended to the new string.

require 'spec_helper'

def increment_string(input)
  input.sub(/\d*$/) { |s| s.empty? ? 1 : s.succ }
end

RSpec.describe "increment_string" do
  it "Example cases" do
    expect(increment_string("foo")).to       eq("foo1")
    expect(increment_string("foobar001")).to eq("foobar002")
    expect(increment_string("foobar1")).to   eq("foobar2")
    expect(increment_string("foobar00")).to  eq("foobar01")
    expect(increment_string("foobar99")).to  eq("foobar100")
    expect(increment_string("")).to          eq("1")
  end
end
