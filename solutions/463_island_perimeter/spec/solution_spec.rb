require 'spec_helper'
require 'byebug'

# @param {Integer[][]} grid
# @return {Integer}
def island_perimeter(grid)
  ret = 0
  grid.each_with_index do |row, i|
    row.each_with_index do |e, j|
      next if e.zero?

      ret += cell_perimeter(grid, i, j)
    end
  end
  ret
end

def cell_perimeter(grid, i, j)
  ret = 0
  if grid.length == 1
    ret += 2
  elsif i == 0
    ret += 1
    ret += 1 if grid[i+1][j] == 0
  elsif i == grid.length - 1
    ret += 1
    ret += 1 if grid[i-1][j] == 0
  else
    ret += 1 if grid[i-1][j] == 0
    ret += 1 if grid[i+1][j] == 0
  end

  if grid.first.length == 1
    ret += 2
  elsif j == 0
    ret += 1
    ret += 1 if grid[i][j+1] == 0
  elsif j == grid.first.length - 1
    ret += 1
    ret += 1 if grid[i][j-1] == 0
  else
    ret += 1 if grid[i][j-1] == 0
    ret += 1 if grid[i][j+1] == 0
  end
  ret
end

describe 'solution' do
  let(:grid) { [[0, 1, 0, 0], [1, 1, 1, 0], [0, 1, 0, 0], [1, 1, 0, 0]] }

  it { expect(island_perimeter([[1]])).to eq 4 }
  it { expect(island_perimeter(grid)).to eq 16 }
end
