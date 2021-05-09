require 'spec_helper'
require 'byebug'

# @param {String} s
# @return {Integer}
def max_power(str)
  ret = [1]
  str.chars.each_with_index do |c, index|
    next if index == str.length - 1

    power = 1
    power += 1 while str[index + power] == c
    ret << power
  end
  ret.max
end

describe 'solution' do
  it { expect(max_power('a')).to eq 1 }
  it { expect(max_power('aa')).to eq 2 }
  it { expect(max_power('aab')).to eq 2 }
  it { expect(max_power('aabb')).to eq 2 }
  it { expect(max_power('aabba')).to eq 2 }
  it { expect(max_power('aabbb')).to eq 3 }
end
