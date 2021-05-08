require 'spec_helper'
require 'byebug'

# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer[]}
def relative_sort_array(arr1, arr2)
  map = arr2.each_with_index.to_h
  first_part = arr1.select { |x| map[x] }.sort { |a,b| map[a] <=> map[b] }
  second_part = arr1.reject { |x| map[x] }.sort
  first_part + second_part
end

describe 'solution' do
  it { expect(relative_sort_array([3, 1, 4], [4, 1])).to eq [4, 1, 3] }
end
