require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @return {Integer}
def pivot_index(nums)
  left_sum = 0
  right_sum = nums.sum
  pos = 0
  while pos < nums.size
    right_sum -= nums[pos]
    left_sum += (pos >= 1 ? nums[pos - 1] : 0)
    return pos if right_sum == left_sum

    pos += 1
  end
  -1
end

describe 'solution' do
  it { expect(pivot_index([1, -1])).to eq(-1) }
  it { expect(pivot_index([1, 2, 4, 3])).to eq 2 }
end
