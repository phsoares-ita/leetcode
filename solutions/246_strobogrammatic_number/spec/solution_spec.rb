require 'spec_helper'
require 'byebug'

# @param {String} num
# @return {Boolean}
def is_strobogrammatic(num)
  dict = { 0 => 0, 1 => 1, 6 => 9, 8 => 8, 9 => 6 }
  digits = num.to_s.chars
  return false if digits.any? { |x| dict[x.to_i].nil? }

  digits.join == digits.map { |x| dict[x.to_i] }.reverse.join
end

describe 'solution' do
  it { expect(is_strobogrammatic(0)).to eq true }
  it { expect(is_strobogrammatic(1)).to eq true }
  it { expect(is_strobogrammatic(3)).to eq false }
  it { expect(is_strobogrammatic(10)).to eq false }
  it { expect(is_strobogrammatic(69)).to eq true }
  it { expect(is_strobogrammatic(88)).to eq true }
  it { expect(is_strobogrammatic(962)).to eq false }
  it { expect(is_strobogrammatic(67)).to eq false }
end
