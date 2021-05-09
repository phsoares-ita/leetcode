require 'spec_helper'
require 'byebug'

# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def find_kth_positive(arr, k)
  all_numbers = (1..arr.max).map { |x| [x, false] }.to_h
  existing_numbers = arr.map { |x| [x, true] }.to_h
  all_numbers.merge!(existing_numbers)
  missing_values = all_numbers.reject { |_, v| v }.keys
  if missing_values.length >= k
    missing_values[k - 1]
  else
    arr.max + (k - missing_values.length)
  end
end

describe 'solution' do
  it { expect(find_kth_positive([1, 10], 1)).to eq 2 }
  it { expect(find_kth_positive([1, 10], 8)).to eq 9 }
  it { expect(find_kth_positive([1, 10], 9)).to eq 11 }
  it { expect(find_kth_positive([1, 2, 4, 5], 3)).to eq 7 }
end
