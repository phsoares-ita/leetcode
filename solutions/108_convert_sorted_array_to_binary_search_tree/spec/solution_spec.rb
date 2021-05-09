require 'spec_helper'
require 'byebug'

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

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
def sorted_array_to_bst(nums)
  return nil if nums.empty?

  mid = nums.length / 2
  mid_value = nums[mid]
  left_tree = sorted_array_to_bst(nums[0...mid])
  right_tree = sorted_array_to_bst(nums[mid + 1..])
  TreeNode.new(mid_value, left_tree, right_tree)
end

describe 'solution' do
  let(:input) { [-10, -3, 0, 5, 9] }

  it { expect(sorted_array_to_bst([])).to eq(nil) }
  it { expect(sorted_array_to_bst([1]).val).to eq(1) }

  it { expect(sorted_array_to_bst([1, 2]).val).to eq(2) }
  it { expect(sorted_array_to_bst([1, 2]).left.val).to eq(1) }

  it { expect(sorted_array_to_bst([1, 2, 3]).val).to eq(2) }
  it { expect(sorted_array_to_bst([1, 2, 3]).left.val).to eq(1) }
  it { expect(sorted_array_to_bst([1, 2, 3]).right.val).to eq(3) }

  it { expect(sorted_array_to_bst([1, 2, 3, 4]).val).to eq(3) }
  it { expect(sorted_array_to_bst([1, 2, 3, 4]).left.val).to eq(2) }
  it { expect(sorted_array_to_bst([1, 2, 3, 4]).left.left.val).to eq(1) }
  it { expect(sorted_array_to_bst([1, 2, 3, 4]).right.val).to eq(4) }

  it { expect(sorted_array_to_bst([1, 2, 3, 4, 5]).val).to eq(3) }
  it { expect(sorted_array_to_bst([1, 2, 3, 4, 5]).left.val).to eq(2) }
  it { expect(sorted_array_to_bst([1, 2, 3, 4, 5]).left.left.val).to eq(1) }
  it { expect(sorted_array_to_bst([1, 2, 3, 4, 5]).right.val).to eq(5) }
  it { expect(sorted_array_to_bst([1, 2, 3, 4, 5]).right.left.val).to eq(4) }

  it { expect(sorted_array_to_bst(input).val).to eq(0) }
  it { expect(sorted_array_to_bst(input).left.val).to eq(-3) }
  it { expect(sorted_array_to_bst(input).left.left.val).to eq(-10) }
  it { expect(sorted_array_to_bst(input).right.val).to eq(9) }
  it { expect(sorted_array_to_bst(input).right.left.val).to eq(5) }
end
