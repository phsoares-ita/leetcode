require 'spec_helper'
require 'byebug'

# @param {Integer[]} arr
# @return {Integer}
def find_lucky(arr)
  occurrences = {}
  arr.each do |num|
    occurrences[num] ||= 0
    occurrences[num] += 1
  end
  lucky_numbers = occurrences.select { |num, count| num == count }.keys
  lucky_numbers.max || -1
end

describe 'solution' do
  it { expect(find_lucky([1])).to eq 1 }
  it { expect(find_lucky([2, 1, 2])).to eq 2 }
  it { expect(find_lucky([3, 4, 2])).to eq(-1) }
end
