require 'spec_helper'
require 'byebug'

# @param {Integer} n
# @return {Integer[]}
def sum_zero(n)
  positive = (1..(n/2)).to_a
  negative = positive.map(&:-@).reverse
  middle = n.odd? ? [0] : []
  negative + middle + positive
end

describe 'solution' do
  it 'solves for 1 to 100' do
    (1..1000).each do |n|
      expect(sum_zero(n).sum).to eq(0)
      expect(sum_zero(n).length).to eq(n)
    end
  end
end

