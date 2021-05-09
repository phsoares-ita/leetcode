require 'spec_helper'
require 'byebug'

# @param {String} a
# @param {String} b
# @return {Boolean}
def rotate_string(a, b)
  return false if a.length != b.length
  return true if a == b

  (0...a.length).any? { a = shift(a); a == b }
end

def shift(str)
  ret = str.chars
  x = ret.shift
  ret << x
  ret.join
end

describe 'solution' do
  it { expect(rotate_string('abc', 'abc')).to eq true }
  it { expect(rotate_string('cab', 'abc')).to eq true }
  it { expect(rotate_string('bca', 'abc')).to eq true }
  it { expect(rotate_string('bcaa', 'abc')).to eq false }
  it { expect(rotate_string('bcx', 'abc')).to eq false }
end
