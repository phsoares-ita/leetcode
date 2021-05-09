require 'spec_helper'
require 'byebug'

# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  ret = [1, 2]
  (2...n).each do |i|
    ret << (ret[i - 1] + ret[i - 2])
  end
  ret[n - 1]
end

describe 'solution' do
  it { expect(climb_stairs(3)).to eq 3 }
  it { expect(climb_stairs(4)).to eq 5 }
  it { expect(climb_stairs(45)).to eq 1_836_311_903 }
end
