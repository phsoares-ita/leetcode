require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  unique_numbers = nums.uniq
  unique_numbers.length < nums.length
end

describe 'solution' do
  it { expect(contains_duplicate([1])).to eq false }
  it { expect(contains_duplicate([1, 1])).to eq true }
  it { expect(contains_duplicate([1, 2])).to eq false }
  it { expect(contains_duplicate([1, 2, 1])).to eq true }
end
