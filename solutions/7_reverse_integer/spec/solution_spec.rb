require 'spec_helper'
require 'byebug'

# @param {Integer} x
# @return {Integer}
def reverse(x)
  ret = x < 0 ? -reverse_int(-x) : reverse_int(x)
  return 0 if ret < -2**31
  return 0 if ret > 2**31 - 1

  ret
end

def reverse_int(x)
  x.to_s.chars.map(&:to_i).reverse.join.to_i
end

describe 'solution' do
  it { expect(reverse(123)).to eq 321 }
  it { expect(reverse(-123)).to eq(-321) }
end
