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
def bst_to_gst(root)
  inorder_nodes = dfs(root, []).reverse
  until inorder_nodes.empty?
    last = inorder_nodes.pop
    inorder_nodes.last.val += last.val if inorder_nodes.last
  end
  root
end

def dfs(root, ret)
  return ret unless root

  dfs(root.right, ret)
  ret << root
  dfs(root.left, ret)

  ret
end

describe 'solution' do
  let(:tree) { TreeNode.new(10, TreeNode.new(9, TreeNode.new(7, TreeNode.new(1), TreeNode.new(8))), TreeNode.new(15)) }
  # it { expect(bst_to_gst(tree).val).to eq 25 }
  it { expect(bst_to_gst(tree).left.left.left.val).to eq 50 }
  it { expect(bst_to_gst(tree).left.left.right.val).to eq 42 }
  it { expect(bst_to_gst(tree).left.left.val).to eq 49 }
end

# 10
# 9     15
# 7
# 1 8
