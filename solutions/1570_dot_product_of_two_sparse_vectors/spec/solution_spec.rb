require 'spec_helper'
require 'byebug'

class SparseVector
  # =begin
  #     :type nums: Integer[]
  # =end
  def initialize(nums)
    @nums = nums
  end

  # Return the dotProduct of two sparse vectors
  # =begin
  #     :type vec: SparseVector
  #     :rtype: Integer
  # =end
  def dotProduct(vec)
    pos = 0
    ret = 0
    while pos < @nums.size
      ret += @nums[pos] * vec[pos]
      pos += 1
    end
    ret
  end

  def [](x)
    @nums[x]
  end
end

# Your SparseVector object will be instantiated and called as such:
# v1 =
# v2 = SparseVector.new(nums2)
# ans = v1.dotProduct(v2)

describe 'solution' do
  let(:v1) { SparseVector.new([1, 2, 3]) }
  let(:v2) { SparseVector.new([3, 2, -1]) }
  it { expect(v1.dotProduct(v2)).to eq 4 }
end
