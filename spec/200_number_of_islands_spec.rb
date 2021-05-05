require 'spec_helper'
require 'byebug'

def number_of_islands(matrix)
  ret = 0
  visited_points = {}
  matrix.each_with_index do |row, i|
    row.each_with_index do |_, j|
      is_land = is_land?(matrix, i, j)
      is_visited = is_visited?(visited_points, i, j)
      if is_land && !is_visited
        visit(matrix, visited_points, i, j)
        ret += 1
      end
    end
  end
  ret
end

def is_land?(matrix, row, column)
  matrix[row][column]&.to_i == 1
end

def is_visited?(visited_points, row, column)
  !!(visited_points[row] && visited_points[row][column])
end

def is_neighbour_lang?(matrix, row, column)
  return false unless row >= 0 && row < matrix.length
  return false unless column >= 0 && column < matrix.first.length

  is_land?(matrix, row, column)
end

def visit(matrix, visited_points, row, column)
  return unless is_land?(matrix, row, column)
  return if is_visited?(visited_points, row, column)

  visited_points[row] ||= []
  visited_points[row][column] = true
  visit(matrix, visited_points, row - 1, column) if is_neighbour_lang?(matrix, row - 1, column)
  visit(matrix, visited_points, row + 1, column) if is_neighbour_lang?(matrix, row + 1, column)
  visit(matrix, visited_points, row, column - 1) if is_neighbour_lang?(matrix, row, column - 1)
  visit(matrix, visited_points, row, column + 1) if is_neighbour_lang?(matrix, row, column + 1)
end

describe 'solution' do
  it { expect(number_of_islands([['0']])).to eq 0 }
  it { expect(number_of_islands([['1']])).to eq 1 }
  it { expect(number_of_islands([[1, 0], [1, 1]])).to eq 1 }
  it { expect(number_of_islands([[1, 0], [0, 1]])).to eq 2 }
  it { expect(number_of_islands([[1, 0, 1], [0, 1, 1]])).to eq 2 }
  it { expect(number_of_islands([[1, 0, 1], [0, 1, 0]])).to eq 3 }
  it { expect(number_of_islands([%w[1 1 0 0 0], %w[1 1 0 0 0], %w[0 0 1 0 0], %w[0 0 0 1 1]])).to eq 3 }
end
