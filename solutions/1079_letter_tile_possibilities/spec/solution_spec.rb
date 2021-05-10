require 'spec_helper'
require 'byebug'

# @param {String} tiles
# @return {Integer}
def num_tile_possibilities(tiles)
  occurrences = map_occurrences(tiles)
  perms = permutations(occurrences, '', [])
  perms.length - 1
end

def map_occurrences(str)
  ret = {}
  str.chars.each do |num|
    ret[num] ||= 0
    ret[num] += 1
  end
  ret
end

def permutations(occurrences, candidate, ret)
  ret << candidate
  occurrences.each do |char, count|
    next if count == 0

    occurrences[char] -= 1
    permutations(occurrences, candidate + char, ret)
    occurrences[char] += 1
  end
  ret
end

describe 'solution' do
  it { expect(num_tile_possibilities('')).to eq 0 }
  it { expect(num_tile_possibilities('A')).to eq 1 }
  it { expect(num_tile_possibilities('AA')).to eq 2 }
  it { expect(num_tile_possibilities('AB')).to eq 4 }
  it { expect(num_tile_possibilities('ABCDEFG')).to eq 13_699 }
end
