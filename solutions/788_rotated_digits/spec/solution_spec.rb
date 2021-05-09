require 'spec_helper'
require 'byebug'

# @param {Integer} n
# @return {Integer}
def rotated_digits(n)
  (1..n).to_a.select { |x| good?(x) }
end

def good?(num)
  dict = { 0 => 0, 1 => 1, 2 => 5, 5 => 2, 6 => 9, 8 => 8, 9 => 6 }
  digits = num.to_s.split('').map(&:to_i)
  return false if digits.any? { |x| dict[x].nil? }

  new_number = digits.map { |x| dict[x].to_s }.join.to_i
  new_number != num
end

describe 'solution' do
  it { expect(rotated_digits(1)).to eq [] }
  it { expect(rotated_digits(10)).to eq [2, 5, 6, 9] }
  it { expect(rotated_digits(30)).to eq [2, 5, 6, 9, 12, 15, 16, 19, 20, 21, 22, 25, 26, 28, 29] }
end
