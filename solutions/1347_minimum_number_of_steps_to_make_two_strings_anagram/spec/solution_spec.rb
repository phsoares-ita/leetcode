require 'spec_helper'
require 'byebug'

# @param {String} s
# @param {String} t
# @return {Integer}
def min_steps(s, t)
  s_ocurrences = map_occurrences(s)
  t_ocurrences = map_occurrences(t)

  ret = 0
  s_ocurrences.each do |s_key, s_count|
    t_count = t_ocurrences[s_key] || 0
    diff = s_count - t_count
    next if diff <= 0

    ret += diff
  end
  ret
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
  it { expect(min_steps('a', 'a')).to eq 0 }
  it { expect(min_steps('a', 'v')).to eq 1 }

  it { expect(min_steps('aa', 'vx')).to eq 2 }
  it { expect(min_steps('aa', 'va')).to eq 1 }
  it { expect(min_steps('aa', 'aa')).to eq 0 }
  it { expect(min_steps('ab', 'xv')).to eq 2 }

  it { expect(min_steps('aba', 'bab')).to eq 1 }
  it { expect(min_steps('bab', 'aba')).to eq 1 }
end
