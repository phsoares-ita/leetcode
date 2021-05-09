require 'spec_helper'
require 'byebug'

# @param {Integer[]} arr
# @return {Integer[][]}
def minimum_abs_difference(arr)
  arr.sort!
  ret = []
  min_diff = arr.last - arr.first
  (0...(arr.length-1)).each do |index|
    ret << [arr[index], arr[index + 1]]
    if min_diff > arr[index + 1] - arr[index]
      min_diff = arr[index + 1] - arr[index]
    end
  end
  ret.select { |a,b| b - a == min_diff }
end

describe 'solution' do
  it { expect(minimum_abs_difference([1,5,4])).to eq [[4,5]] }
  it { expect(minimum_abs_difference([3,8,-10,23,19,-4,-14,27])).to eq [[-14,-10],[19,23],[23,27]] }

  
end
