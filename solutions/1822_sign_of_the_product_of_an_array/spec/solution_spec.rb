require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @return {Integer}
def array_sign(nums)
  nums.each do |num|
    return 0 if num.zero?
  end
  negative_signs = nums.select(&:negative?).count
  negative_signs.even? ? 1 : -1
end

describe 'solution' do
  it { expect(array_sign([1])).to eq 1 }
  it { expect(array_sign([-1])).to eq -1 }
  it { expect(array_sign([-1,-1])).to eq 1 }
  it { expect(array_sign([-1,1000,-2000])).to eq 1 }
  it { expect(array_sign([0])).to eq 0 }
end
