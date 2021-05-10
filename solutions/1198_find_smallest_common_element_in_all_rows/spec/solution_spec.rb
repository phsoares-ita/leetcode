require 'spec_helper'
require 'byebug'

# @param {Integer[][]} mat
# @return {Integer}
def smallest_common_element(mat)
  return -1 if mat.any?(&:empty?)

  min_first_element = mat.map(&:first).min
  return min_first_element if mat.all? { |row| row.first == min_first_element }

  mat.each { |row| row.shift if row.first == min_first_element }
  smallest_common_element(mat)
end

describe 'solution' do
  it { expect(smallest_common_element([[1, 2, 3], [1, 2]])).to eq 1 }
  it { expect(smallest_common_element([[1, 2, 3], [2]])).to eq 2 }

  it { expect(smallest_common_element([[1, 2, 3], [5]])).to eq(-1) }
  it { expect(smallest_common_element([[1], []])).to eq(-1) }
  it { expect(smallest_common_element([[], []])).to eq(-1) }
end
