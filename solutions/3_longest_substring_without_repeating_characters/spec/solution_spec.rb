require 'spec_helper'
require 'byebug'

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  return s.length if s.length < 2

  pos = 0
  ret = 0
  cache = {}
  s.chars.each_with_index do |char, index|
    if index == s.length - 1
      ret = [ret, index - pos + 1].max
    elsif pos > index && repeated_char(char, cache)
      cache = {}
      ret = [ret, index - pos].max
    else
      save_char_in_cache(char, cache)
    end
  end
  ret
end

def repeated_char(char, cache)
  !!cache[char]
end

def save_char_in_cache(char, cache)
  cache[char] = true
end

describe 'solution' do
  it { expect(length_of_longest_substring('')).to eq 0 }
  it { expect(length_of_longest_substring('a')).to eq 1 }
  it { expect(length_of_longest_substring('ab')).to eq 2 }
  it { expect(length_of_longest_substring('aba')).to eq 2 }
  it { expect(length_of_longest_substring('aab')).to eq 2 }
  it { expect(length_of_longest_substring('baa')).to eq 2 }
  it { expect(length_of_longest_substring('baab')).to eq 2 }
  it { expect(length_of_longest_substring('baaa')).to eq 2 }
end
