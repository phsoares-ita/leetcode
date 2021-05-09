require 'spec_helper'
require 'byebug'

# @param {Integer[][]} grid
# @return {Integer}
def count_negatives(grid)
  grid.flatten.select(&:negative?).count
end

describe 'solution' do
  let(:grid) { [[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]] }
  it { expect(count_negatives(grid)).to eq 8 }
end
