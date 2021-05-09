require 'spec_helper'
require 'byebug'

# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  occurrences = {}
  s.chars.each do |char|
    occurrences[char] ||= 0
    occurrences[char] += 1
  end
  s.chars.each_with_index do |char, index|
    return index if occurrences[char] == 1
  end
  -1
end

describe 'solution' do
  it { expect(first_uniq_char('')).to eq(-1) }
  it { expect(first_uniq_char('a')).to eq 0 }
  it { expect(first_uniq_char('aa')).to eq(-1) }
  it { expect(first_uniq_char('ab')).to eq 0 }
  it { expect(first_uniq_char('aaab')).to eq 3 }
end
