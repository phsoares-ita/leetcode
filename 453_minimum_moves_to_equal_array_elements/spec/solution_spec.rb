require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @return {Integer}
def min_moves(nums)
  min_value = nums.min
  nums.map { |x| x - min_value }.sum
end

describe 'solution' do
  it { expect(min_moves([1, 1])).to eq 0 }
  it { expect(min_moves([1, 2])).to eq 1 }
  it { expect(min_moves([1, 9, 7])).to eq 14 }
end
