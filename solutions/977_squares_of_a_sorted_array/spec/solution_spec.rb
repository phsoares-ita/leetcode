require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums (non-decreasing)
# @return {Integer[]}
def sorted_squares(nums)
  nums1 = nums.select { |x| x >= 0 }
  nums2 = nums.reject { |x| x >= 0 }.reverse.map(&:-@)
  ret = []
  until (nums1 + nums2).empty?
    if nums1.empty? || nums2.empty?
      ret = ret + nums1 + nums2
      break
    elsif nums1.first < nums2.first
      ret << nums1.shift
    else
      ret << nums2.shift
    end
  end
  ret.map { |x| x**2 }
end

def find_first_positive_index(nums)
  nums.each_with_index do |num, index|
    return index if num >= 0
  end
  nums.length
end

describe 'solution' do
  it { expect(sorted_squares([1, 2, 3])).to eq [1, 4, 9] }
  it { expect(sorted_squares([-4, -1, 2, 3])).to eq [1, 4, 9, 16] }
end
