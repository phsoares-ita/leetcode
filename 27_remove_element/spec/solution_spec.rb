require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
  occurrences = map_occurrences(nums)
  val_occurrences = occurrences[val] || []
  indices = val_occurrences.sort
  until indices.empty?
    index = indices.shift
    indices = indices.map { |x| x - 1 }
    nums.delete_at(index)
  end
  nums.length
end

def map_occurrences(nums)
  ret = {}
  nums.each_with_index do |num, index|
    ret[num] ||= []
    ret[num].push(index)
  end
  ret
end

describe 'solution' do
  it { expect(remove_element([1, 2, 2, 3], 2)).to eq 2 }
  it { expect(remove_element([1, 2, 2, 3], 3)).to eq 3 }
end
