# Returns the summary of its ranges

require 'spec_helper'

def summary_ranges(nums)
  nums.uniq.slice_when { |i, j|
    j - i > 1
  }.map { |chunk|
    chunk.one? ? chunk.first.to_s : "#{chunk.first}->#{chunk.last}"
  }
end

describe 'summary_ranges' do
  it 'Example cases' do
    expect(summary_ranges([])).to eq([])
    expect(summary_ranges([1, 1, 1, 1])).to eq(['1'])
    expect(summary_ranges([1, 2, 3, 4])).to eq(['1->4'])
    expect(summary_ranges([0, 1, 2, 5, 6, 9])).to eq(['0->2', '5->6', '9'])
    expect(summary_ranges([0, 1, 2, 3, 4, 5, 6, 7])).to eq(['0->7'])
  end
end
