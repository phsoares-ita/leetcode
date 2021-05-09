require 'spec_helper'
require 'byebug'

# @param {Integer[]} arr
# @return {Integer}
def peak_index_in_mountain_array(arr)
  (0...(arr.length - 1)).each do |i|
    next if arr[i] <= arr[i - 1]
    next if arr[i] <= arr[i + 1]

    return i
  end
end

describe 'solution' do
  it { expect(peak_index_in_mountain_array([0, 1, 0])).to eq 1 }
  it { expect(peak_index_in_mountain_array([0, 1, 2, 0])).to eq 2 }
  it { expect(peak_index_in_mountain_array([0, 100, 20, 0])).to eq 1 }
end
