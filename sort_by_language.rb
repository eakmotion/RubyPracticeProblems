# write a function that returns the array sorted alphabetically by the programming language.
# In case there are some developers that code in the same language, sort them alphabetically by the first name.

require 'spec_helper'

def sort_by_language(arr)
  arr.sort_by { |hsh| [hsh[:language], hsh[:firstName]] }
end

RSpec.describe "sort_by_language" do
  it "Example cases" do
    list = [
      { firstName: 'Nikau', lastName: 'R.', country: 'New Zealand', continent: 'Oceania', age: 39, language: 'Ruby' },
      { firstName: 'Precious', lastName: 'G.', country: 'South Africa', continent: 'Africa', age: 22, language: 'JavaScript' },
      { firstName: 'Maria', lastName: 'S.', country: 'Peru', continent: 'Americas', age: 30, language: 'C' },
      { firstName: 'Agustin', lastName: 'V.', country: 'Uruguay', continent: 'Americas', age: 19, language: 'JavaScript' }
    ]

    sorted_list = [
      { firstName: 'Maria', lastName: 'S.', country: 'Peru', continent: 'Americas', age: 30, language: 'C' },
      { firstName: 'Agustin', lastName: 'V.', country: 'Uruguay', continent: 'Americas', age: 19, language: 'JavaScript' },
      { firstName: 'Precious', lastName: 'G.', country: 'South Africa', continent: 'Africa', age: 22, language: 'JavaScript' },
      { firstName: 'Nikau', lastName: 'R.', country: 'New Zealand', continent: 'Oceania', age: 39, language: 'Ruby' }
    ]

    expect(sort_by_language(list)).to eq(sorted_list)
  end
end
