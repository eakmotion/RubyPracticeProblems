# Extract only the quotes from a string.

require 'spec_helper'

def get_quotes(string)
  reg = /".+?"/
  string.scan(reg)
end

describe 'get_quotes' do
  it 'Example cases' do
    expect(get_quotes('"Winners never quit and quitters never win." - Vince Lombardi, "My motto is, \'Never quit.\'" - Henry Rollins'))
      .to eq(["\"Winners never quit and quitters never win.\"","\"My motto is, 'Never quit.'\""]) 
  end
end
