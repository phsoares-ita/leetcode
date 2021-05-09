require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  pos = 0
  nums.each_with_index do |num, index|
    next if num.zero?

    nums[pos], nums[index] = nums[index], nums[pos]
    pos += 1
  end
  nums
end

describe 'solution' do
  it 'works with example' do
    nums = move_zeroes([0, 1, 0, 3, 12])
    expect(nums).to eq [1, 3, 12, 0, 0]
  end

  it 'single zero' do
    nums = move_zeroes([0])
    expect(nums).to eq [0]
  end

  it 'single non zero' do
    nums = move_zeroes([1])
    expect(nums).to eq [1]
  end

  it 'two numbers' do
    nums = move_zeroes([0, 1])
    expect(nums).to eq [1, 0]
  end

  it 'two numbers' do
    nums = move_zeroes([1, 0])
    expect(nums).to eq [1, 0]
  end

  it '3 numbers' do
    nums = move_zeroes([1, 0, 2])
    expect(nums).to eq [1, 2, 0]
  end

  it '3 numbers' do
    nums = move_zeroes([0, 0, 2])
    expect(nums).to eq [2, 0, 0]
  end
end
