# Design a data structure that supports the following two operations:

# void addWord(word)
# bool search(word)

# search(word) can search a literal word or a regular expression string
# containing only letters a-z or .. A . means it can represent any one letter.

require 'spec_helper'

class WordDictionary
  def initialize
    @dict = []
  end

  def add_word(word)
    @dict << word
  end

  def search(word)
    @dict.any? { |w| w.match(/\A#{word}\Z/) }
  end
end


describe '' do
  it 'Example cases' do
    wd = WordDictionary.new
    wd.add_word('a')
    wd.add_word('at')
    wd.add_word('ate')
    wd.add_word('ear')

    expect(wd.search('a')).to eq(true)
    expect(wd.search('a.')).to eq(true)
    expect(wd.search('a.e')).to eq(true)
    expect(wd.search('b')).to eq(false)
    expect(wd.search('e.')).to eq(false)
    expect(wd.search('ea.')).to eq(true)
    expect(wd.search('ea..')).to eq(false)
  end
end
