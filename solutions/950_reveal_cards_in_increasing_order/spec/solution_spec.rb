require 'spec_helper'
require 'byebug'

# @param {Integer[]} deck
# @return {Integer[]}
def deck_revealed_increasing(deck)
  ret = []
  sorted = deck.sort
  positions = (0...deck.length).to_a
  sorted.each do |num|
    pos = positions.shift
    ret[pos] = num
    positions.push(positions.shift)
  end
  ret
end

describe 'solution' do
  it { expect(deck_revealed_increasing([1])).to eq [1] }
  it { expect(deck_revealed_increasing([1, 2])).to eq [1, 2] }
  it { expect(deck_revealed_increasing([1, 2, 3])).to eq [1, 3, 2] }
  it { expect(deck_revealed_increasing([1, 2, 3, 4])).to eq [1, 3, 2, 4] }
  it { expect(deck_revealed_increasing([1, 2, 3, 4, 5])).to eq [1, 5, 2, 4, 3] }
end
