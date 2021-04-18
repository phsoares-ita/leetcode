require 'spec_helper'
require 'byebug'

# one solution
# you may not use the same element twice
def two_sum(nums, target)
  num_indices = map_num_indices(nums)
  nums.each_with_index do |num, index|
    other_index = find_index(num_indices, target - num, index)
    return [index, other_index] if other_index
  end
  nil
end

def map_num_indices(nums)
  ret = {}
  nums.each_with_index do |num, index|
    ret[num] ||= []
    ret[num] << index
  end
  ret
end

def find_index(num_indices, target, index)
  indices = num_indices[target]
  return nil unless indices

  indices.find { |x| x != index }
end

describe 'solution' do
  it { expect(two_sum([1, 1], 2)).to eq [0, 1] }
  it { expect(two_sum([1, 1], 3)).to eq nil }
  it { expect(two_sum([2, 3], 4)).to eq nil }
  it { expect(two_sum([2, 3, 7, 9], 12)).to eq [1, 3] }
end
