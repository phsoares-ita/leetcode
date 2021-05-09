require 'spec_helper'
require 'byebug'

module SortHelper
  def self.insert(arr, element)
    return [element] if arr.empty?

    index = find_index(arr, element)
    index += 1 while index < arr.length && arr[index] <= element
    arr.insert(index, element)
  end

  def self.find_index(arr, element)
    left = 0
    right = arr.length - 1
    while left < right
      mid_index = (left + right) / 2
      mid = arr[mid_index]
      if mid < element
        left = mid_index + 1
      elsif mid > element
        right = mid_index - 1
      else
        return mid_index
      end
    end
    left
  end
end

class KthLargest
  include SortHelper
  # =begin
  #     :type k: Integer
  #     :type nums: Integer[]
  # =end
  def initialize(k, nums)
    @k = k
    @nums = nums.sort
  end

  # =begin
  #     :type val: Integer
  #     :rtype: Integer
  # =end
  def add(val)
    @nums = SortHelper.insert(@nums, val)
    @nums[@nums.length - @k]
  end
end

describe 'insert into sorted array' do
  let(:obj) { KthLargest.new(3, [4, 5, 8, 2]) }

  it 'should find the second largest element' do
    expect(obj.add(3)).to eq(4)
    expect(obj.add(5)).to eq(5)
    expect(obj.add(10)).to eq(5)
    expect(obj.add(9)).to eq(8)
  end

  it { expect(SortHelper.insert([], 1)).to eq([1]) }

  it { expect(SortHelper.insert([1], 1)).to eq([1, 1]) }
  it { expect(SortHelper.insert([10], 1)).to eq([1, 10]) }
  it { expect(SortHelper.insert([1], 10)).to eq([1, 10]) }

  it { expect(SortHelper.insert([1, 100], 0)).to eq([0, 1, 100]) }
  it { expect(SortHelper.insert([1, 100], 1)).to eq([1, 1, 100]) }
  it { expect(SortHelper.insert([1, 100], 2)).to eq([1, 2, 100]) }
  it { expect(SortHelper.insert([1, 100], 100)).to eq([1, 100, 100]) }
  it { expect(SortHelper.insert([1, 100], 101)).to eq([1, 100, 101]) }

  it { expect(SortHelper.insert([1, 100, 101], 0)).to eq([0, 1, 100, 101]) }
  it { expect(SortHelper.insert([1, 100, 101], 1)).to eq([1, 1, 100, 101]) }
  it { expect(SortHelper.insert([1, 100, 101], 2)).to eq([1, 2, 100, 101]) }
  it { expect(SortHelper.insert([1, 100, 101], 100)).to eq([1, 100, 100, 101]) }
  it { expect(SortHelper.insert([1, 100, 101], 101)).to eq([1, 100, 101, 101]) }
  it { expect(SortHelper.insert([1, 100, 101], 102)).to eq([1, 100, 101, 102]) }
end
