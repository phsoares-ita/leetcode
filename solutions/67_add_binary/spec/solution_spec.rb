require 'spec_helper'
require 'byebug'

# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  a = a.chars
  b = b.chars
  carry = 0
  ret = []
  until (a + b).empty? && carry == 0
    x = (a.pop || '0').to_i
    y = (b.pop || '0').to_i
    ret << ((x + y + carry) % 2).to_s
    carry = ((x + y + carry) / 2)
  end
  ret.reverse.join
end

describe 'solution' do
  it { expect(add_binary('0', '0')).to eq '0' }
  it { expect(add_binary('0', '1')).to eq '1' }
  it { expect(add_binary('1', '1')).to eq '10' }
  it { expect(add_binary('11', '1')).to eq '100' }
  it { expect(add_binary('11', '10')).to eq '101' }
end
