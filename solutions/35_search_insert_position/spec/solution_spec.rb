require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  return 0 if nums.empty?

  left = 0
  right = nums.length - 1
  while left <= right
    pivot = (left + right) / 2
    if nums[pivot] > target
      right = pivot - 1
    elsif nums[pivot] < target
      left = pivot + 1
    else
      return pivot
    end
  end
  left
end

describe 'solution' do
  it { expect(search_insert([], 0)).to eq 0 }

  it { expect(search_insert([1], 0)).to eq 0 }
  it { expect(search_insert([1], 1)).to eq 0 }
  it { expect(search_insert([1], 2)).to eq 1 }

  it { expect(search_insert([1, 2], 0)).to eq 0 }
  it { expect(search_insert([1, 2], 1)).to eq 0 }
  it { expect(search_insert([1, 2], 2)).to eq 1 }
  it { expect(search_insert([1, 2], 3)).to eq 2 }
end
