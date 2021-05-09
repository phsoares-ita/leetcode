require 'spec_helper'
require 'byebug'

# @param {Integer} num
# @return {String}
def to_hex(num)
  return '0' if num == 0
  return to_hex(2**32 + num) if num < 0

  dict = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8',
           9 => '9', 10 => 'a', 11 => 'b', 12 => 'c', 13 => 'd', 14 => 'e', 15 => 'f' }
  ret = []
  while num > 0
    ret << dict[num % 16]
    num /= 16
  end
  ret.reverse.join
end

describe 'solution' do
  it { expect(to_hex(-1)).to eq 'ffffffff' }
  it { expect(to_hex(0)).to eq '0' }
  it { expect(to_hex(1)).to eq '1' }
  it { expect(to_hex(10)).to eq 'a' }
  it { expect(to_hex(15)).to eq 'f' }
  it { expect(to_hex(16)).to eq '10' }
end
