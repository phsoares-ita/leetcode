require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @return {Integer}
def find_length_of_lcis(nums)
  return nums.length if nums.length < 2

  ret = 0
  last_pos = 0
  (1...nums.length).each do |index|
    last_pos = index if nums[index] <= nums[index - 1]
    ret = [ret, index - last_pos + 1].max
  end
  ret
end

describe 'solution' do
  it { expect(find_length_of_lcis([1])).to eq 1 }

  it { expect(find_length_of_lcis([1, 2])).to eq 2 }
  it { expect(find_length_of_lcis([1, 1])).to eq 1 }

  it { expect(find_length_of_lcis([1, 2, 3])).to eq 3 }
  it { expect(find_length_of_lcis([1, 3, 2])).to eq 2 }
  it { expect(find_length_of_lcis([3, 1, 2])).to eq 2 }
  it { expect(find_length_of_lcis([3, 2, 1])).to eq 1 }

  it { expect(find_length_of_lcis([1, 2, 3, 3, -1, 8, 9])).to eq 3 }
end
