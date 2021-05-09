require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  pos = 1
  while pos < nums.length
    nums.delete_at(pos) while nums[pos] == nums[pos - 1]
    pos += 1
  end
  nums.length
end

describe 'solution' do
  let(:arr) { [1, 2, 2, 3] }
  it 'removes duplictes in place' do
    expect(remove_duplicates(arr)).to eq(3)
    expect(arr).to eq [1, 2, 3]
  end
end
