require 'spec_helper'
require 'byebug'

# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} new_color
# @return {Integer[][]}
def flood_fill(image, sr, sc, new_color)
  color = image[sr][sc]
  visited = {}
  positions_to_change = dfs(image, sr, sc, color, [], visited)
  positions_to_change.each do |r, c|
    image[r][c] = new_color
  end
  image
end

def dfs(image, sr, sc, color, positions_with_same_color, visited)
  return positions_with_same_color if visited[[sr, sc]]
  return positions_with_same_color if sr < 0 || sr >= image.length
  return positions_with_same_color if sc < 0 || sc >= image.first.length

  pixel_color = image[sr][sc]
  visited[[sr, sc]] = true
  return positions_with_same_color if color != pixel_color

  positions_with_same_color << [sr, sc]
  dfs(image, sr - 1, sc, color, positions_with_same_color, visited)
  dfs(image, sr + 1, sc, color, positions_with_same_color, visited)
  dfs(image, sr, sc - 1, color, positions_with_same_color, visited)
  dfs(image, sr, sc + 1, color, positions_with_same_color, visited)
  positions_with_same_color
end

describe 'solution' do
  it { expect(flood_fill([[1]], 0, 0, 2)).to eq [[2]] }
  it { expect(flood_fill([[1, 1, 1], [1, 1, 0], [1, 0, 1]], 0, 0, 2)).to eq [[2, 2, 2], [2, 2, 0], [2, 0, 1]] }
end
