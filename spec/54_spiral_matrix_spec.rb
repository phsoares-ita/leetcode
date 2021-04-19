require 'spec_helper'
require 'byebug'

# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  return matrix.flatten.compact if matrix.length < 2
  
  ret = []
  ret << matrix.shift
  ret << matrix.map { |row| row.pop }
  ret << matrix.pop.reverse
  ret << matrix.map { |row| row.shift }.reverse

  ret.flatten.compact + spiral_order(matrix)
end

describe 'solution' do
  it { expect(spiral_order([[1, 2, 3], [4, 5, 6], [7, 8, 9]])).to eq [1, 2, 3, 6, 9, 8, 7, 4, 5] }
  it { expect(spiral_order([[1]])).to eq [1] }
  it { expect(spiral_order([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]])).to eq [1, 2, 3, 4, 8, 12, 16, 15, 14, 13, 9, 5, 6, 7, 11, 10] }
end
