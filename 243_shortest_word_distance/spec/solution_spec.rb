require 'spec_helper'
require 'byebug'

# @param {String[]} words_dict
# @param {String} word1
# @param {String} word2
# @return {Integer}
def shortest_distance(words_dict, word1, word2)
  ret = []
  positions = map_positions(words_dict)
  positions[word1].each do |pos1|
    positions[word2].each do |pos2|
      ret << (pos1 - pos2).abs
    end
  end
  ret.min
end

def map_positions(words_dict)
  positions = {}
  words_dict.each_with_index do |word, index|
    positions[word] ||= []
    positions[word] << index
  end
  positions
end

# 1 <= wordsDict.length <= 3 * 10**4
# 1 <= wordsDict[i].length <= 10
describe 'solution' do
  let(:words_dict) { %w[practice makes perfect coding makes] }
  it { expect(shortest_distance(words_dict, 'practice', 'coding')).to eq 3 }
end
