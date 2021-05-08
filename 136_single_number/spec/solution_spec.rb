require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  ret = 0
  nums.each { |num| ret ^= num }
  ret
end

describe 'solution' do
  it { expect(single_number([1, 2, 2])).to eq 1 }
  it { expect(single_number([1, 1, 2])).to eq 2 }
end
