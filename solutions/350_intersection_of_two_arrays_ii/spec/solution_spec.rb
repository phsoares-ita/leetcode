require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
  occurrences1 = map_occurrences(nums1)
  occurrences2 = map_occurrences(nums2)
  ret = []
  occurrences1.each do |k1, v1|
    next unless (v2 = occurrences2[k1])

    ret += ([k1] * [v1, v2].min)
  end
  ret
end

def map_occurrences(nums)
  ret = {}
  nums.each do |num|
    ret[num] ||= 0
    ret[num] += 1
  end
  ret
end

describe 'solution' do
  it { expect(intersect([1, 2, 2, 3, 4], [2, 2, 3, 3])).to eq [2, 2, 3] }
end
