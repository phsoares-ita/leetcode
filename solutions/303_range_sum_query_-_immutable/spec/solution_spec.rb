require 'spec_helper'
require 'byebug'

class NumArray
  # =begin
  #     :type nums: Integer[]
  # =end
  def initialize(nums)
    @nums = nums
  end

  # =begin
  #     :type left: Integer
  #     :type right: Integer
  #     :rtype: Integer
  # =end
  def sum_range(left, right)
    @nums[left..right].sum
  end
end

describe 'solution' do
  let(:obj) { NumArray.new([1, 2, 3, 4, 5]) }
  it { expect(obj.sum_range(0, 4)).to eq 15 }
  it { expect(obj.sum_range(0, 0)).to eq 1 }
  it { expect(obj.sum_range(4, 4)).to eq 5 }
end
