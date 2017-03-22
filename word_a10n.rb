# Write a function that takes a string and turns any and all "words" (see below)
# within that string of length 4 or greater into an abbreviation following the same rules.
#
# Notes:
# A "word" is a sequence of alphabetical characters. By this definition,
# any other character like a space or hyphen (eg. "elephant-ride") will split up
# a series of letters into two words (eg. "elephant" and "ride").
#
# The abbreviated version of the word should have the first letter,
# then the number of removed characters, then the last letter
# (eg. "elephant ride" => "e6t r2e").

require "spec_helper"

class Abbreviator
  def self.abbreviate(string)
    string.gsub /(\w)(\w+{2})(\w)/ do |word|
      "#{$1}#{$2.size}#{$3}"
    end
  end
end

RSpec.describe "abbreviate" do
  it "Example cases" do
    expect(Abbreviator.abbreviate("banana")).to eq("b4a")
    expect(Abbreviator.abbreviate("double-barrel")).to eq("d4e-b4l")
    expect(Abbreviator.abbreviate("You, and I, should speak.")).to eq("You, and I, s4d s3k.")
  end
end
