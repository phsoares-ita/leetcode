require 'spec_helper'
require 'byebug'

# @param {String} str
# @return {Integer}
def max_number_of_balloons(str)
  occurrences = map_occurrences(str)
  # balloon
  ret = [occurrences.fetch('b', 0), occurrences.fetch('a', 0), occurrences.fetch('l', 0) / 2,
         occurrences.fetch('o', 0) / 2, occurrences.fetch('n', 0)]
  ret.min
end

def map_occurrences(str)
  ret = {}
  str.each_char do |char|
    ret[char] ||= 0
    ret[char] += 1
  end
  ret
end

describe 'solution' do
  it { expect(max_number_of_balloons('a')).to eq 0 }
  it { expect(max_number_of_balloons('loonbalxballpoon')).to eq 2 }
end
