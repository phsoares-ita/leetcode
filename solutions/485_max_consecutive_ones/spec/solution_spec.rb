require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @return {Integer}
def find_max_consecutive_ones(nums)
  one_occurrences = nums.chunk { |e| e }.map { |e, ary| [e, ary.length] }.select { |k, _| k == 1 }
  return 0 if one_occurrences.empty?

  one_occurrences.max_by { |_, v| v }.last
end

describe 'solution' do
  it { expect(find_max_consecutive_ones([0])).to eq 0 }
  it { expect(find_max_consecutive_ones([0, 0])).to eq 0 }
  it { expect(find_max_consecutive_ones([1, 0])).to eq 1 }
  it { expect(find_max_consecutive_ones([0, 1])).to eq 1 }
  it { expect(find_max_consecutive_ones([1, 1])).to eq 2 }
  it { expect(find_max_consecutive_ones([1, 1, 0, 0, 0, 0])).to eq 2 }
  it { expect(find_max_consecutive_ones([0, 0, 0, 1, 1, 1, 1, 0])).to eq 4 }
end
