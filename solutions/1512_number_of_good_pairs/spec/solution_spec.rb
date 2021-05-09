require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @return {Integer}
def num_identical_pairs(nums)
  ret = 0
  (0...nums.length).each do |i|
    ((i + 1)...nums.length).each do |j|
      ret += 1 if nums[i] == nums[j]
    end
  end
  ret
end

describe 'solution' do
  it { expect(num_identical_pairs([1, 1])).to eq 1 }
  it { expect(num_identical_pairs([1, 1, 2, 2])).to eq 2 }
  it { expect(num_identical_pairs([1, 1, 1, 1])).to eq 6 }
end
