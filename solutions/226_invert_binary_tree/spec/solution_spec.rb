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
# @param {TreeNode} root
# @return {TreeNode}
def invert_tree(root)
  return root unless root

  root.left, root.right = root.right, root.left
  invert_tree(root.left)
  invert_tree(root.right)
  root
end

describe 'solution' do
  context 'two levels' do
    let(:root) { TreeNode.new(1, TreeNode.new(2), TreeNode.new(3)) }
    it { expect(invert_tree(root).val).to eq 1 }
    it { expect(invert_tree(root).left.val).to eq 3 }
    it { expect(invert_tree(root).right.val).to eq 2 }
  end

  context 'tree levels' do
    # [1] -> [2, 3] -> [4,5,6,nil]
    let(:root2) { TreeNode.new(1, TreeNode.new(2, TreeNode.new(4), TreeNode.new(5)), TreeNode.new(3, TreeNode.new(6))) }
    it { expect(invert_tree(root2).val).to eq 1 }
    it { expect(invert_tree(root2).left.val).to eq 3 }
    it { expect(invert_tree(root2).right.val).to eq 2 }
    it { expect(invert_tree(root2).right.left.val).to eq 5 }
  end
end
