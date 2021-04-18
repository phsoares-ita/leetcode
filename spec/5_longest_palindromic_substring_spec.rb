require 'spec_helper'
require 'byebug'

def longest_palindrome(str)
  return str if str.length <= 1

  ret = []
  (0...str.length).each do |i|
    ret << get_largest_palindrome(str, i, i)
    ret << get_largest_palindrome(str, i, i + 1) if str[i] == str[i + 1]
  end
  ret.sort_by { |x| x.length }.last
end

def get_largest_palindrome(str, i, j)
  while str[i - 1] == str[j + 1] && i - 1 >= 0 && j + 1 < str.length
    i -= 1
    j += 1
  end
  str[i..j]
end

describe 'solution' do
  it { expect(longest_palindrome('1')).to eq '1' }
  it { expect(longest_palindrome('1b')).to eq 'b' }
  it { expect(longest_palindrome('1b1')).to eq '1b1' }
  it { expect(longest_palindrome('x1b1')).to eq '1b1' }
  it { expect(longest_palindrome('1b1x')).to eq '1b1' }
  it { expect(longest_palindrome('y1b1x')).to eq '1b1' }
  it { expect(longest_palindrome('yy1b1x')).to eq '1b1' }

  context do
    before do
      @long_pal_str = '0123443210' * 100
      @long_non_pal_str = '0123456789' * 100
    end

    it { expect(longest_palindrome(@long_pal_str)).to eq @long_pal_str }
    it { expect(longest_palindrome(@long_non_pal_str)).to eq '9' }
  end
end

#max size is 1e3
