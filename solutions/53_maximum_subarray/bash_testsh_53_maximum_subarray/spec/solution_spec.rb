require 'spec_helper'
require 'byebug'

# -5, 7, -2, 1, 2
# max = -5
# max = 7
# max = 5
# max = 6
# max = 8

# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  ret = [nums.shift]
  nums.each do |num|
    num_to_add = ret.last.negative? ? num : ret.last + num
    ret << num_to_add
  end
  ret.max
end

describe 'solution' do
  it { expect(max_sub_array([-1])).to eq(-1) }
  it { expect(max_sub_array([0])).to eq(0) }
  it { expect(max_sub_array([1])).to eq 1 }

  it { expect(max_sub_array([1, 2])).to eq 3 }
  it { expect(max_sub_array([1, -2])).to eq 1 }
  it { expect(max_sub_array([-1, 2])).to eq 2 }
  it { expect(max_sub_array([-1, -2])).to eq(-1) }

  it { expect(max_sub_array([-5, 7, -2, 1])).to eq 7 }
  it { expect(max_sub_array([-5, 7, -2, 3])).to eq 8 }
  it { expect(max_sub_array([-5, 7, -2, 1, 2])).to eq 8 }

  it { expect(max_sub_array([1] * 3e4)).to eq 3e4 }
end
