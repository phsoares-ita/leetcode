require 'spec_helper'
require 'byebug'

# @param {Character[][]} board
# @return {Integer}
def count_battleships(board)
  ret = 0
  board.each_with_index do |row, i|
    row.each_with_index do |e, j|
      next unless e == 'X'

      mark_boat_as_visited(board, i, j)
      ret += 1
    end
  end
  ret
end

def mark_boat_as_visited(board, i, j)
  board[i][j] = '#'

  u = i + 1
  while u < board.length && board[u][j] == 'X'
    board[u][j] = '#'
    u += 1
  end

  u = j + 1
  while u < board.first.length && board[i][u] == 'X'
    board[i][u] = '#'
    u += 1
  end
end

describe 'solution' do
  let(:board) { [['X', '.', '.', 'X'], ['.', '.', '.', 'X'], ['.', '.', '.', 'X']] }
  it { expect(count_battleships(board)).to eq 2 }
end
