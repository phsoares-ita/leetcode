require 'spec_helper'
require 'byebug'

# @param {Integer[][]} matrix
# @return {Integer[][]}
def transpose(matrix)
  ret = Array.new(matrix.first.length) { Array.new(matrix.length) }
  matrix.each_with_index do |row, i|
    row.each_with_index do |e, j|
      ret[j][i] = e
    end
  end
  ret
end

describe 'solution' do
  let(:input) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }
  let(:output) { [[1, 4, 7], [2, 5, 8], [3, 6, 9]] }
  it { expect(transpose(input)).to eq output }
end
