# When provided with a SHA-256 hash, return the value that was hashed.
# You are also given the characters that make the expected value,
# but in alphabetical order.

# The returned value is less than 10 characters long. Return nil when
# the hash cannot be cracked with the given characters.

require 'spec_helper'
require 'digest'

def sha256Crack(hash, characters)
  characters.chars.permutation
            .find{|x| Digest::SHA256.hexdigest(x.join('')) == hash}
            .join('') rescue nil
end

describe 'sha256Crack' do
  it 'Example cases' do
    hash = 'b8c49d81cb795985c007d78379e98613a4dfc824381be472238dbd2f974e37ae'
    characters = 'deGioOstu'
    output = sha256Crack(hash, characters)

    expect(output.length).to eq(characters.length)
  end
end
