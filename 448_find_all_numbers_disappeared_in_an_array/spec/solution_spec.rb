require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
  return [] if nums.empty?

  nums.each do |num|
    n = nums[num.abs - 1]
    nums[num.abs - 1] = -n if n.positive?
  end

  ret = []
  nums.each_with_index do |num, index|
    ret << (index + 1) if num.positive?
  end
  ret
end

describe 'solution' do
  it { expect(find_disappeared_numbers([1])).to eq [] }
  it { expect(find_disappeared_numbers([2, 2])).to eq [1] }
  it { expect(find_disappeared_numbers([1, 1, 3])).to eq [2] }
  it { expect(find_disappeared_numbers([1, 1, 1, 4])).to eq [2, 3] }
  it { expect(find_disappeared_numbers([4, 3, 2, 7, 8, 2, 3, 1])).to eq [5, 6] }
end
