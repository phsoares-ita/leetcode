require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @return {Integer}
def array_pair_sum(nums)
  nums.sort!
  nums.each_with_index.select { |_, i| i.even? }.map { |n, _| n }.sum
end

describe 'solution' do
  it { expect(array_pair_sum([1, 2])).to eq 1 }
  it { expect(array_pair_sum([1, 2, 3, 4])).to eq 4 }
end
