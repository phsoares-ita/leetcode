require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  occurrences = {}
  nums.each do |num|
    occurrences[num] ||= 0
    occurrences[num] += 1
  end
  occurrences.max_by { |_, v| v }.first
end

describe 'solution' do
  it { expect(majority_element([10])).to eq 10 }
  it { expect(majority_element([10, 10])).to eq 10 }
  it { expect(majority_element([11, 11, 10])).to eq 11 }
  it { expect(majority_element([3, 2, 3])).to eq 3 }
end
