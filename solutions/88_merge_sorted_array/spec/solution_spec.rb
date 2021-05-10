require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  pos1 = 0
  pos2 = 0
  while pos2 < n
    if pos1 >= m
      nums1[pos1] = nums2[pos2]
      pos1 += 1
      pos2 += 1
    elsif nums1[pos1] >= nums2[pos2]
      nums1.insert(pos1, nums2[pos2])
      nums1.pop
      m += 1
      pos1 += 1
      pos2 += 1
    elsif nums1[pos1] < nums2[pos2]
      pos1 += 1
    end
  end
  m
end

describe 'solution' do
  context 'normal array' do
    let(:nums1) { [1, 3, 0, 0, 0] }
    let(:nums2) { [0, 2, 5] }

    it 'merges two arrays' do
      merge(nums1, 2, nums2, 3)
      expect(nums1).to eq [0, 1, 2, 3, 5]
    end
  end

  context 'at most one element arrays' do
    let(:nums1) { [0] }
    let(:nums2) { [1] }

    it 'merges two arrays' do
      merge(nums1, 0, nums2, 1)
      expect(nums1).to eq [1]
    end
  end
end
