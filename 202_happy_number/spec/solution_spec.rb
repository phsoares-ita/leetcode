require 'spec_helper'
require 'byebug'

# @param {Integer} n
# @return {Boolean}
def is_happy(n, visited = {})
  return true if n == 1
  return false if visited[n]

  visited[n] = true
  new_number = n.to_s.chars.map(&:to_i).map { |x| x**2 }.sum
  is_happy(new_number, visited)
end

describe 'solution' do
  it { expect(is_happy(1)).to eq true }
  it { expect(is_happy(2)).to eq false }
  it { expect(is_happy(3)).to eq false }
  it { expect(is_happy(4)).to eq false }
  it { expect(is_happy(5)).to eq false }
  it { expect(is_happy(6)).to eq false }
  it { expect(is_happy(7)).to eq true }
  it { expect(is_happy(8)).to eq false }
  it { expect(is_happy(9)).to eq false }
  it { expect(is_happy(10)).to eq true }
  it { expect(is_happy(100)).to eq true }
  it { expect(is_happy(101)).to eq false }
  it { expect(is_happy(19)).to eq true }
  it { expect(is_happy(1e9)).to eq true }
end
