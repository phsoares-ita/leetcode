require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @param {Integer} n
# @return {Integer[]}

# nums: ret -> [0,1,2,3,4,5] : [0,3,1,4,2,5]
def shuffle(nums, n)
  ret = Array.new(2*n)
  (0...n).each do |i|
    ret[2*i] = nums[i]
  end
  (n...2*n).each do |i|
    ret[2*(i-n) + 1] = nums[i]
  end
  ret
end

describe 'solution' do
  it { expect(shuffle([2, 1], 1)).to eq [2, 1] }
  it { expect(shuffle([1, 7, 8, 0], 2)).to eq [1, 8, 7, 0] }
  it { expect(shuffle([2,5,1,3,4,7], 3)).to eq [2,3,5,4,1,7] }
end


