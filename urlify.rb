# Replaces single spaces with %20 and removes trailing spaces

require 'spec_helper'

def urlify(string)
	if string.include?(' ')
		string.strip.gsub!(' ', '%20')
	else
		string
	end
end

RSpec.describe "urlify" do
	it "return the same url" do
		expect(urlify("http://www.github.com")).to eq("http://www.github.com")
	end

	it "return a proper url without space" do
		expect(urlify("http://www.github.com/eak pun pun ")).to eq("http://www.github.com/eak%20pun%20pun")
	end
end
