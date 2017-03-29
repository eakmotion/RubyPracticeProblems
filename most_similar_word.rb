# Find out, which word from the dictionary is most similar to the entered one.
# The similarity is described by the minimum number of letters you have to add,
# remove or replace in order to get from the entered word to one of
# the dictionary.
# The lower the number of required changes, the higher the similarity
# between each two words.

require 'spec_helper'

class Dictionary
  def initialize(words)
    @words=words
  end
  def find_most_similar(term)
    @words.min_by do |word|
      levenshtein(word, term)
    end
  end

  private
  def levenshtein(str1, str2)
    m = str1.length
    n = str2.length
    return m if n == 0
    return n if m == 0
    d = Array.new(m+1) {Array.new(n+1)}

    (0..m).each {|i| d[i][0] = i}
    (0..n).each {|j| d[0][j] = j}
    (1..n).each do |j|
      (1..m).each do |i|
        d[i][j] = if str1[i-1] == str2[j-1]   # adjust index into string
                    d[i-1][j-1]               # no operation required
                  else
                    [ d[i-1][j]+1,            # deletion
                      d[i][j-1]+1,            # insertion
                      d[i-1][j-1]+1,          # substitution
                    ].min
                  end
      end
    end
    d[m][n]
  end
end

RSpec.describe "find_most_similar" do
  it "Example cases" do
    words=['cherry', 'peach', 'pineapple', 'melon', 'strawberry', 'raspberry', 'apple', 'coconut', 'banana']
    dict = Dictionary.new(words)

    expect(dict.find_most_similar('strawbery')).to eq('strawberry')
    expect(dict.find_most_similar('berry')).to eq('cherry')
    expect(dict.find_most_similar('aple')).to eq('apple')
  end
end
