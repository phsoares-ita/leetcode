require 'spec_helper'
require 'byebug'

# @param {Integer[][]} points
# @return {Integer}
def max_width_of_vertical_area(points)
  x_values = points.map(&:first)
  x_values.sort!
  ret = []
  (1...x_values.length).each do |index|
    ret << (x_values[index] - x_values[index - 1])
  end
  ret.max
end

describe 'solution' do
  it { expect(max_width_of_vertical_area([[10, 2], [8, 1]])).to eq 2 }
  it { expect(max_width_of_vertical_area([[10, 2], [9, 10]])).to eq 1 }
end
