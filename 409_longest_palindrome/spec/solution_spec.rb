require 'spec_helper'
require 'byebug'

# @param {String} s
# @return {Integer}
def longest_palindrome(s)
  occurrences = map_occurrences(s)
  count_odd_chars = occurrences.select { |_, v| v.odd? }.count
  diff = [count_odd_chars - 1, 0].max
  s.length - diff
end

def map_occurrences(s)
  ret = {}
  s.chars.each do |char|
    ret[char] ||= 0
    ret[char] += 1
  end
  ret
end

describe 'solution' do
  it { expect(longest_palindrome('')).to eq 0 }
  it { expect(longest_palindrome('1')).to eq 1 }
  it { expect(longest_palindrome('12')).to eq 1 }
  it { expect(longest_palindrome('123')).to eq 1 }
  it { expect(longest_palindrome('1123')).to eq 3 }
end
