require 'spec_helper'
require 'byebug'

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  map_occurrences(s) == map_occurrences(t)
end

def map_occurrences(str)
  ret = {}
  str.each_char do |c|
    ret[c] ||= 0
    ret[c] += 1
  end
  ret
end

describe 'solution' do
  it { expect(is_anagram('a', 'a')).to eq true }
  it { expect(is_anagram('a', 'b')).to eq false }
  it { expect(is_anagram('ax', 'xb')).to eq false }
  it { expect(is_anagram('aaxa', 'xaaa')).to eq true }
  it { expect(is_anagram('aaxa', 'xaaaa')).to eq false }
  it { expect(is_anagram('aaxa', 'xyaaa')).to eq false }
end
