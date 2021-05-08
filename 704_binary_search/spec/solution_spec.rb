require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  find_pos(nums, target, 0, nums.length - 1)
end

def find_pos(nums, target, left, right)
  while left <= right
    mid_pos = (left + right) / 2
    mid_value = nums[mid_pos]
    if target > mid_value
      left = mid_pos + 1
    elsif target < mid_value
      right = mid_pos - 1
    else
      return mid_pos
    end
  end
  -1
end

describe 'solution' do
  it { expect(search([1], 1)).to eq 0 }
  it { expect(search([1], -1)).to eq(-1) }
  it { expect(search([1], 10)).to eq(-1) }

  it { expect(search([1, 2], -1)).to eq(-1) }
  it { expect(search([1, 2], 1)).to eq 0 }
  it { expect(search([1, 2], 2)).to eq 1 }
  it { expect(search([1, 2], 10)).to eq(-1) }

  it { expect(search([1, 3, 5, 6, 8], 3)).to eq 1 }
  it { expect(search([1, 3, 5, 6, 8], 8)).to eq 4 }
  it { expect(search([1, 3, 5, 6, 8], 30)).to eq(-1) }
end
