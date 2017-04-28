 # Find the missing letter(s). You may need to output them by the order a-z.
 # It is possible that there is more than one missing letter from
 # more than one set of alphabet.

require 'spec_helper'

def missing_alphabets(s)
  num_sets = s.chars.group_by(&:itself).values.sort_by(&:size).last.size
  alphabet = ('a'..'z').to_a
  alphabet.map do |letter|
    if s.count(letter) == num_sets
      ""
    else
      letter * (num_sets - s.count(letter))
    end
  end.join
end

describe 'missing_alphabets' do
  it 'Example cases' do
    expect(missing_alphabets("abcdefghijklmnopqrstuvwxy"))
      .to eq("z")
    expect(missing_alphabets("abcdefghijklmnopqrstuvwxyz"))
      .to eq("")
    expect(missing_alphabets("aabbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyy"))
      .to eq("zz")
    expect(missing_alphabets("abbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxy"))
      .to eq("ayzz")
    expect(missing_alphabets("codewars"))
      .to eq("bfghijklmnpqtuvxyz")
  end
end
