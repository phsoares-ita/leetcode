require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersection(nums1, nums2)
  ret = []
  nums1.sort!
  nums2.sort!
  pos1 = 0
  pos2 = 0
  while pos1 < nums1.length && pos2 < nums2.length
    if nums1[pos1] < nums2[pos2]
      pos1 += 1
    elsif nums1[pos1] > nums2[pos2]
      pos2 += 1
    else
      target = nums1[pos1]
      ret << target
      pos1 += 1 while nums1[pos1] == target
      pos2 += 1 while nums2[pos2] == target
    end
  end
  ret
end

describe 'solution' do
  it { expect(intersection([1,2,2], [2,2,3])).to eq [2] }
end
