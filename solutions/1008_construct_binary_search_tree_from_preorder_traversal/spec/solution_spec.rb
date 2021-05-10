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

# @param {Integer[]} preorder
# @return {TreeNode}
def bst_from_preorder(preorder)
  return nil if preorder.empty?

  val = preorder.shift
  index = find_first_bigger_value(preorder, val)
  left = bst_from_preorder(preorder[0...index])
  right = bst_from_preorder(preorder[index..])
  TreeNode.new(val, left, right)
end

def find_first_bigger_value(nums, val)
  nums.each_with_index do |num, index|
    return index if num > val
  end
  nums.length
end

describe 'solution' do
  context 'find index of first element that is bigger than a target' do
    it { expect(find_first_bigger_value([10, 11, 12], 9)).to eq 0 }
    it { expect(find_first_bigger_value([10, 11, 12], 10)).to eq 1 }
    it { expect(find_first_bigger_value([10, 11, 12], 11)).to eq 2 }
    it { expect(find_first_bigger_value([10, 11, 12], 12)).to eq 3 }
  end

  context 'build simple bst from preorder ' do
    it { expect(bst_from_preorder([11, 10, 12]).val).to eq 11 }
    it { expect(bst_from_preorder([11, 10, 12]).right.val).to eq 12 }
    it { expect(bst_from_preorder([11, 10, 12]).left.val).to eq 10 }
  end

  context 'build unbalanced to the right bst from preorder ' do
    it { expect(bst_from_preorder([10, 11, 12]).val).to eq 10 }
    it { expect(bst_from_preorder([10, 11, 12]).right.val).to eq 11 }
    it { expect(bst_from_preorder([10, 11, 12]).right.right.val).to eq 12 }
  end

  context 'build unbalanced to the left bst from preorder ' do
    it { expect(bst_from_preorder([12, 10, 7]).val).to eq 12 }
    it { expect(bst_from_preorder([12, 10, 7]).left.val).to eq 10 }
    it { expect(bst_from_preorder([12, 10, 7]).left.left.val).to eq 7 }
  end
end
