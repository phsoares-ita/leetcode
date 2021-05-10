require 'spec_helper'
require 'byebug'

# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  ret = []
  carry = 1
  until digits.empty? && carry == 0
    digit = (digits.pop || 0) + carry
    ret << (digit % 10)
    carry = (digit / 10)
  end
  ret.reverse
end

describe 'solution' do
  it { expect(plus_one([1])).to eq [2] }
  it { expect(plus_one([9])).to eq [1, 0] }
end
