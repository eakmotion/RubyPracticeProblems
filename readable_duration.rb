# Write a function which formats a duration, given as a number of seconds, 
# in a human-friendly way.

require "spec_helper"

def format_duration(seconds)
  if seconds == 0
    "now"
  else
    duration = {
      year:   seconds / (60 * 60 * 24 * 365),
      day:    seconds / (60 * 60 * 24) % 365,
      hour:   seconds / (60 * 60) % 24,
      minute: seconds / 60 % 60,
      second: seconds % 60
    }

    @output = []

    duration.each do |k, v|
      if v > 0
        @output << "#{v} #{k}"
        @output.last << "s" if v != 1
      end
    end

    @output.join(', ').gsub(/\,\s(?=\d+\s\w+$)/, " and ")
  end
end

RSpec.describe "format_duration" do
  it "Example cases" do
    expect(format_duration(1)).to eq("1 second")
    expect(format_duration(62)).to eq("1 minute and 2 seconds")
    expect(format_duration(120)).to eq("2 minutes")
    expect(format_duration(3600)).to eq("1 hour")
    expect(format_duration(3662)).to eq("1 hour, 1 minute and 2 seconds")
  end
end
