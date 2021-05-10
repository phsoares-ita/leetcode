require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  occurrences = map_occurrences(nums)
  occurrences.values.select { |v| v.length > 1 }.select { |indices| close?(indices, k) }.count.positive?
end

def close?(indices, k)
  (1...indices.length).each do |index|
    return true if indices[index] - indices[index - 1] <= k
  end
  false
end

def map_occurrences(nums)
  ret = {}
  nums.each_with_index do |num, index|
    ret[num] ||= []
    ret[num] << index
  end
  ret
end

describe 'solution' do
  it { expect(contains_nearby_duplicate([1, 2, 3, 1, 4], 3)).to eq true }
  it { expect(contains_nearby_duplicate([1, 2, 3, 1, 4], 2)).to eq false }
end
