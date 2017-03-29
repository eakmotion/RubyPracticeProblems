# Extending the Hash class to support a new method called 'flattened_keys'.
# The purpose of this method is to return a new hash that has any nested
# values flattened so that there is only the single root hash structure.
# The keys from the nested hash will be merged into the parent,
# separated by underscores.

require 'spec_helper'

class Hash
  def flattened_keys(keys = [])
    map do |key, value|
      new_key = [*keys, key].compact.join("_")
      new_key = new_key.to_sym unless [*keys, key].map(&:class).include?(String)
      Hash === value ? value.flattened_keys(new_key) : { new_key => value }
    end.reduce(:merge)
  end
end

RSpec.describe "flattened_keys" do
  it "Example cases" do
    unflat = {a: 1, 'b' => 2, info: {id: 1, 'name' => 'example'}}
    expect(unflat.flattened_keys).to eq({:a=>1, "b"=>2, :info_id=>1, "info_name"=>"example"})
  end
end
