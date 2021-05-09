require 'spec_helper'
require 'byebug'

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# @param {TreeNode} root
# @param {TreeNode} sub_root
# @return {Boolean}
def is_subtree(root, sub_root)
  return true if root.nil? && sub_root.nil?
  return false unless root && sub_root

  all_matches(root, sub_root) || is_subtree(root.left, sub_root) || is_subtree(root.right, sub_root)
end

def all_matches(a, b)
  return true if !a && !b
  return false unless a&.val == b&.val

  all_matches(a.left, b.left) && all_matches(a.right, b.right)
end

describe 'solution' do
  let(:tree1) { TreeNode.new(10, TreeNode.new(20), TreeNode.new(30)) }
  let(:tree2) { TreeNode.new(1, TreeNode.new(2), TreeNode.new(3)) }

  it 'returns false when there is no subtree' do
    expect(is_subtree(tree1, tree2)).to eq false
  end

  it 'returns false when there is no subtree' do
    tree1.right.right = tree2
    expect(is_subtree(tree1, tree2.dup)).to eq true
  end
end
