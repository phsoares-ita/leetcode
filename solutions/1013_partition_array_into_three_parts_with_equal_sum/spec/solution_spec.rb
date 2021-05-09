require 'spec_helper'
require 'byebug'

# @param {Integer[]} arr
# @return {Boolean}
def can_three_parts_equal_sum(arr)
  return false unless arr.sum % 3 == 0

  target_sum = arr.sum / 3

  i = find_partition_index(arr, target_sum)
  return false unless i

  j = find_partition_index(arr[i..], target_sum)
  return false unless j

  j += i
  i >= 0 && j >= 0 && j < arr.length
end

def find_partition_index(arr, target)
  sum = 0
  arr.each_with_index do |num, index|
    sum += num
    return index + 1 if sum == target
  end
  nil
end

describe 'solution' do
  it { expect(can_three_parts_equal_sum([1, 3])).to eq false }
  it { expect(can_three_parts_equal_sum([3, 3, 3])).to eq true }
  it { expect(can_three_parts_equal_sum([3, 3, 6])).to eq false }
  it { expect(can_three_parts_equal_sum([-1, 1, -1, 1])).to eq false }
end
