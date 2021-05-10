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
# @param {Integer} val
# @return {TreeNode}
def insert_into_bst(root, val)
  return TreeNode.new(val) unless root

  if root.val < val
    if root.right
      insert_into_bst(root.right, val)
    else
      root.right = TreeNode.new(val)
    end
  elsif root.left
    insert_into_bst(root.left, val)
  else
    root.left = TreeNode.new(val)
  end
  root
end

describe 'solution' do
  let(:tree5) do
    TreeNode.new(4,
                 TreeNode.new(2, TreeNode.new(1), TreeNode.new(3)),
                 TreeNode.new(7, TreeNode.new(6)))
  end
  it { expect(insert_into_bst(tree5, 5).right.left.left.val).to eq 5 }
end
