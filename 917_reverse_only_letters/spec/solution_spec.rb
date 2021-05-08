require 'spec_helper'
require 'byebug'

# @param {String} s
# @return {String}
def reverse_only_letters(str)
  l = 0
  r = str.length - 1
  ret = str.chars
  while l < r
    if ret[l] =~ /[a-zA-Z]/ && ret[r] =~ /[a-zA-Z]/
      ret[l], ret[r] = ret[r], ret[l]
    elsif ret[l] =~ /[a-zA-Z]/
      r -= 1
      next
    elsif ret[r] =~ /[a-zA-Z]/
      l += 1
      next
    end
    r -= 1
    l += 1
  end
  ret.join
end

describe 'solution' do
  it { expect(reverse_only_letters('1')).to eq '1' }
  it { expect(reverse_only_letters('12')).to eq '12' }
  it { expect(reverse_only_letters('1a')).to eq '1a' }
  it { expect(reverse_only_letters('b1a')).to eq 'a1b' }
  it { expect(reverse_only_letters('?6C40E')).to eq '?6E40C' }
end
