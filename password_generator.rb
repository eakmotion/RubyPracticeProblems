# You need to write a password generator that meets the following criteria:

# 6 - 20 characters long
# contains at least one lowercase letter
# contains at least one uppercase letter
# contains at least one number
# contains only alphanumeric characters (no special characters)
# Return the random password as a string.

require 'spec_helper'

ALPHA_NUM = [*('a'..'z'), *('A'..'Z'), *('0'..'9')]
def password_gen
  Array.new(20) { ALPHA_NUM.sample }.take(rand(6..20)).join
end

def test_pwd(pwd)
  (/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^\W_]{6,20}$/=~pwd) != nil
end

describe 'password_gen' do
  it "Example cases" do
    expect(test_pwd(password_gen()))
  end
end
