require 'spec_helper'
require 'byebug'

# @param {String} s
# @return {Boolean}
def can_permute_palindrome(str)
  char_occurrences = {}
  str.each_char do |char|
    char_occurrences[char] ||= 0
    char_occurrences[char] += 1
  end
  char_occurrences.select { |_, count| count.odd? }.length <= 1
end

describe 'solution' do
  it { expect(can_permute_palindrome('a')).to eq true }
  it { expect(can_permute_palindrome('aa')).to eq true }
  it { expect(can_permute_palindrome('ab')).to eq false }
  it { expect(can_permute_palindrome('abc')).to eq false }
  it { expect(can_permute_palindrome('aba')).to eq true }
end
