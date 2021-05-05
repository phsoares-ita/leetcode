require 'spec_helper'
require 'byebug'

# s.length <= 1000
def longest_palindrome(str)
  ret = []
  (0...str.length).each do |i|
    ret << largest_palindrome(str, i, i)
    ret << largest_palindrome(str, i, i + 1) if i + 1 < str.length
  end
  ret.max_by(&:length)
end

def largest_palindrome(str, i, j)
  return str[i] if str[i] != str[j]

  while i - 1 >= 0 && j + 1 < str.length && str[i - 1] == str[j + 1]
    i -= 1
    j += 1
  end
  str[i..j]
end

def is_palindrome?(str)
  str == str.reverse
end

describe 'solution' do
  it { expect(longest_palindrome('1')).to eq '1' }
  it { expect(longest_palindrome('12')).to eq '1' }
  it { expect(longest_palindrome('121')).to eq '121' }
  it { expect(longest_palindrome('121')).to eq '121' }
  it { expect(longest_palindrome('11234567899876543201')).to eq '2345678998765432' }
end