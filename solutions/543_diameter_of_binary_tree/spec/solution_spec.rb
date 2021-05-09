require 'spec_helper'
require 'byebug'

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right, :level

  def initialize(val = 0, left = nil, right = nil, level = 0)
    @val = val
    @left = left
    @right = right
    @level = level
  end
end

# @param {TreeNode} root
# @return {Integer}
def diameter_of_binary_tree(root)
  return 0 unless root

  d1 = 2 + max_branch_size(root.left) + max_branch_size(root.right)
  d2 = diameter_of_binary_tree(root.left)
  d3 = diameter_of_binary_tree(root.right)
  [d1, d2, d3].max
end

def max_branch_size(node)
  return -1 unless node

  [1 + max_branch_size(node.left), 1 + max_branch_size(node.right)].max
end

describe 'solution' do
  let(:root1) { TreeNode.new(1, TreeNode.new(2, TreeNode.new(3)), TreeNode.new(4, TreeNode.new(5))) }
  let(:root2) { TreeNode.new(1, TreeNode.new(2), TreeNode.new(4, TreeNode.new(5, TreeNode.new(6)), TreeNode.new(7))) }
  it { expect(diameter_of_binary_tree(root1)).to eq 4 }
  it { expect(diameter_of_binary_tree(root2)).to eq 3 }
end
