require 'spec_helper'
require 'byebug'

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  ret = 0
  grid.each_with_index do |row, i|
    row.each_with_index do |e, j|
      next unless e == '1'

      visit_land(grid, i, j)
      ret += 1
    end
  end
  ret
end

def visit_land(grid, i, j)
  return unless i >= 0 && i < grid.length
  return unless j >= 0 && j < grid.first.length
  return unless grid[i][j] == '1'

  grid[i][j] = 'X'
  visit_land(grid, i + 1, j)
  visit_land(grid, i - 1, j)
  visit_land(grid, i, j - 1)
  visit_land(grid, i, j + 1)
end

describe 'solution' do
  it { expect(num_islands([%w[1 0], %w[0 1]])).to eq 2 }
  it { expect(num_islands([%w[1 0], %w[1 1]])).to eq 1 }
end
