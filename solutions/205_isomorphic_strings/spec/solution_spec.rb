require 'spec_helper'
require 'byebug'

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  return fale if s.length != t.length

  pos1 = 0
  pos2 = 0
  map_left_to_right = {}
  map_right_to_left = {}
  while pos1 < s.length
    a = s[pos1]
    b = t[pos2]

    if !map_left_to_right[a] && !map_right_to_left[b]
      map_left_to_right[a] = b
      map_right_to_left[b] = a
    elsif map_left_to_right[a] != b || map_right_to_left[b] != a
      return false
    end

    pos1 += 1
    pos2 += 1
  end
  true
end

describe 'solution' do
  it { expect(is_isomorphic('egg', 'add')).to eq true }
  it { expect(is_isomorphic('egg', 'adx')).to eq false }
  it { expect(is_isomorphic('badc', 'baba')).to eq false }
end
