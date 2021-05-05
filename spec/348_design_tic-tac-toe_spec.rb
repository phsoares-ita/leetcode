require 'spec_helper'
require 'byebug'

class TicTacToe
  def initialize(n)
    @size = n
    @board = Array.new(n) { Array.new(n) }
    @finished = false
  end

  def move(row, col, player)
    return if @finished
    raise StandardError, 'Movimento proibido' if @board[row][col]

    @board[row][col] = player
    return 0 unless is_winning_move?(row, col, player)

    @finished = true
    player
  end

  private

  def is_winning_move?(row, col, player)
    return true if (0...@size).all? { |i| @board[i][col] == player }
    return true if (0...@size).all? { |i| @board[row][i] == player }
    return true if (0...@size).all? { |i| @board[i][i] == player }

    (0...@size).all? { |i| @board[@size - i - 1][i] == player }
  end
end

describe 'solution' do
  it 'first player wins in row' do
    game = TicTacToe.new(3)
    expect(game.move(0, 0, 1)).to eq(0)
    expect(game.move(1, 0, 2)).to eq(0)
    expect(game.move(0, 1, 1)).to eq(0)
    expect(game.move(1, 1, 2)).to eq(0)
    expect(game.move(0, 2, 1)).to eq(1)
  end

  it 'second player wins in row' do
    game = TicTacToe.new(3)
    expect(game.move(2, 0, 1)).to eq(0)
    expect(game.move(1, 0, 2)).to eq(0)
    expect(game.move(0, 1, 1)).to eq(0)
    expect(game.move(1, 1, 2)).to eq(0)
    expect(game.move(0, 2, 1)).to eq(0)
    expect(game.move(1, 2, 2)).to eq(2)
  end

  it 'first player wins in column' do
    game = TicTacToe.new(3)
    expect(game.move(0, 0, 1)).to eq(0)
    expect(game.move(1, 2, 2)).to eq(0)
    expect(game.move(1, 0, 1)).to eq(0)
    expect(game.move(1, 1, 2)).to eq(0)
    expect(game.move(2, 0, 1)).to eq(1)
  end

  it 'second player wins in column' do
    game = TicTacToe.new(3)
    expect(game.move(2, 0, 1)).to eq(0)
    expect(game.move(0, 1, 2)).to eq(0)
    expect(game.move(0, 2, 1)).to eq(0)
    expect(game.move(1, 1, 2)).to eq(0)
    expect(game.move(1, 2, 1)).to eq(0)
    expect(game.move(2, 1, 2)).to eq(2)
  end

  it 'first player wins in main diagonal' do
    game = TicTacToe.new(3)
    expect(game.move(0, 0, 1)).to eq(0)
    expect(game.move(2, 0, 2)).to eq(0)
    expect(game.move(1, 1, 1)).to eq(0)
    expect(game.move(0, 2, 2)).to eq(0)
    expect(game.move(2, 2, 1)).to eq(1)
  end

  it 'first player wins in secondary diagonal' do
    game = TicTacToe.new(3)
    expect(game.move(0, 2, 2)).to eq(0)
    expect(game.move(0, 1, 1)).to eq(0)
    expect(game.move(1, 1, 2)).to eq(0)
    expect(game.move(1, 0, 1)).to eq(0)
    expect(game.move(2, 0, 2)).to eq(2)
  end
end
