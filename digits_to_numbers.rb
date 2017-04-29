require 'spec_helper'

def proc_arr(arr)
  f = -> n {(1..n).reduce(1, :*)}
  xs = arr.sort
  p = xs.group_by(&:itself).values.reduce(f.(xs.size)) {|a,b| a / f.(b.size)}
  [p, xs.join('').to_i(10), xs.reverse.join('').to_i(10)]
end

describe 'proc_arr' do
  it 'Example cases' do
    expect(proc_arr(['1','2','2','3','2','3']))
      .to eq([60, 122233, 332221])
    expect(proc_arr(['1','2','3','0','5','1','1','3']))
      .to eq([3360, 1112335, 53321110])
  end
end
