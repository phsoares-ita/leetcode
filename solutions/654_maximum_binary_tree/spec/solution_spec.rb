require 'spec_helper'
require 'byebug'

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# @param {Integer[]} nums
# @return {TreeNode}
def construct_maximum_binary_tree(nums)
  return nil if nums.empty?

  max_num = nums.max
  index = nums.find_index(max_num)

  left = construct_maximum_binary_tree(nums[0...index])
  right = construct_maximum_binary_tree(nums[index + 1..])
  TreeNode.new(max_num, left, right)
end

describe 'solution' do
  it { expect(construct_maximum_binary_tree([1, 2, 3, 4]).val).to eq 4 }
  it { expect(construct_maximum_binary_tree([1, 2, 4, 3]).val).to eq 4 }
  it { expect(construct_maximum_binary_tree([1, 2, 4, 3]).right.val).to eq 3 }
end
