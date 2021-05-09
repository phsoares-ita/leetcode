require 'spec_helper'
require 'byebug'

# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  occurrences = map_occurrences(numbers)
  occurrences.each do |num, index|
    next unless (indices = occurrences[target - num])

    return [index.first + 1, indices.first + 1] if num != target - num
    next if indices.length < 2

    return [indices[0] + 1, indices[1] + 1]
  end
end

def map_occurrences(numbers)
  ret = {}
  numbers.each_with_index do |num, index|
    ret[num] ||= []
    ret[num] << index
  end
  ret
end

describe 'solution' do
  it { expect(two_sum([1, 2, 3], 4)).to eq [1, 3] }
  it { expect(two_sum([0, 0, 1, 2], 0)).to eq [1, 2] }
end
