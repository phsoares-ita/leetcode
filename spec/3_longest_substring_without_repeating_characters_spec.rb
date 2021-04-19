require 'spec_helper'
require 'byebug'

def length_of_longest_substring(str)
  pos1 = 0
  pos2 = 0
  ret = 0
  char_indices = {}
  while pos2 < str.length
    char = str[pos2]
    if char_indices[char]
      ret = [ret, pos2 - pos1].max
      pos1 = char_indices[char] + 1
      char_indices = char_indices.select { |_, v| v >= pos1 }
    else
      ret = [ret, pos2 - pos1 + 1].max
    end
    char_indices[char] = pos2
    pos2 += 1
  end
  ret
end

describe 'solution' do
  context 'all different chars' do
    it { expect(length_of_longest_substring('')).to eq(0) }
    it { expect(length_of_longest_substring('1')).to eq(1) }
    it { expect(length_of_longest_substring('12')).to eq(2) }
    it { expect(length_of_longest_substring('12345')).to eq(5) }
  end

  context 'two equal chars' do
    it { expect(length_of_longest_substring('11')).to eq(1) }
    it { expect(length_of_longest_substring('011')).to eq(2) }
    it { expect(length_of_longest_substring('101')).to eq(2) }
    it { expect(length_of_longest_substring('110')).to eq(2) }
    it { expect(length_of_longest_substring('11ABCD')).to eq(5) }
    it { expect(length_of_longest_substring('A11ABCD')).to eq(5) }
    it { expect(length_of_longest_substring('1BCD1A')).to eq(5) }
    it { expect(length_of_longest_substring('BCD11A')).to eq(4) }
  end

  context 'three equal chars' do
    it { expect(length_of_longest_substring('111')).to eq(1) }
    it { expect(length_of_longest_substring('0111')).to eq(2) }
    it { expect(length_of_longest_substring('ABCD111')).to eq(5) }
  end
end
