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

# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
  return true if p.nil? && q.nil?
  return false if !p || !q
  return false if p.val != q.val

  is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
end

describe 'solution' do
  let(:root1) { TreeNode.new(1, TreeNode.new(2), TreeNode.new(3)) }
  let(:root2) { TreeNode.new(1, TreeNode.new(2), TreeNode.new(4)) }
  it { expect(is_same_tree(root1, root2)).to eq false }
  it { expect(is_same_tree(root1, root1)).to eq true }
end
