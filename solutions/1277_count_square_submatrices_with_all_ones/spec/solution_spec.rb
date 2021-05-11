require 'spec_helper'
require 'byebug'

# 1 1 1
# 1 2 2
# 1 2 3

# @param {Integer[][]} matrix
# @return {Integer}
def count_squares(matrix)
  matrix.each_with_index do |row, i|
    row.each_with_index do |e, j|
      next unless e == 1
      next unless i > 0 && j > 0

      new_value = [matrix[i - 1][j], matrix[i - 1][j - 1], matrix[i][j - 1]].min + 1
      matrix[i][j] = new_value
    end
  end

  matrix.map(&:sum).sum
end

describe 'solution' do
  it { expect(count_squares([[1]])).to eq 1 }
  it { expect(count_squares([[1, 0], [0, 0]])).to eq 1 }
  it { expect(count_squares([[1, 0], [0, 1]])).to eq 2 }
  it { expect(count_squares([[1, 0], [1, 1]])).to eq 3 }
  it { expect(count_squares([[1, 1], [1, 1]])).to eq 5 }

  let(:matrix) { [[0, 1, 1, 1], [1, 1, 1, 1], [0, 1, 1, 1]] }
  it { expect(count_squares(matrix)).to eq 15 }

  let(:big_matrix_ones) { [[1] * 300] * 300 }
  it { expect(count_squares(big_matrix_ones)).to eq 179_700 }

  let(:big_matrix_zeros) { [[0] * 300] * 300 }
  it { expect(count_squares(big_matrix_zeros)).to eq 0 }

  let(:big_matrix_zebra) { [[0, 1] * 150] * 300 }
  it { expect(count_squares(big_matrix_zebra)).to eq 150 * 300 }
end
