require 'spec_helper'
require 'byebug'

def two_sum(nums, target)
  occurrences = map_occurrences(nums)
  occurrences.each do |k, indices|
    next unless occurrences[target - k]
    next if k == target - k && indices.length <= 1
    return indices.slice(0, 2) if k == target - k

    return [indices.first, occurrences[target - k].first].sort
  end
end

def map_occurrences(nums)
  ret = {}
  nums.each_with_index do |num, index|
    ret[num] ||= []
    ret[num] << index
  end
  ret
end

describe 'two_sum' do
  it { expect(two_sum([1, 1], 2)).to eq [0, 1] }
  it { expect(two_sum([1, 2], 3)).to eq [0, 1] }
  it { expect(two_sum([3, 3], 6)).to eq [0, 1] }
  it { expect(two_sum([3, 2, 4], 6)).to eq [1, 2] }
  it { expect(two_sum([1, 2, 7], 9)).to eq [1, 2] }
end
