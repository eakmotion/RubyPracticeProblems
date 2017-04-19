# Create "like" system from Facebook.
# The text that should be displayed next to such an item.

require 'spec_helper'

def likes(name)
  suffix = name.size > 1 ? " like this" : " likes this"

  case name.size
    when 0    then "no one" + suffix
    when 1..2 then "#{name.join(' and ')}" + suffix
    when 3    then "#{name[0]}, #{name[1]} and #{name[2]}" + suffix
  else
    "#{name[0]}, #{name[1]} and #{name.size - 2} others" + suffix
  end
end

describe 'likes' do
  it 'Example cases' do
    expect(likes([])).to eq('no one likes this')
    expect(likes(['Peter'])).to eq('Peter likes this')
    expect(likes(['Jacob', 'Alex'])).to eq('Jacob and Alex like this')
    expect(likes(['Max', 'John', 'Mark'])).to eq('Max, John and Mark like this')
    expect(likes(['Alex', 'Jacob', 'Mark', 'Max'])).to eq('Alex, Jacob and 2 others like this')
  end
end
