require 'spec_helper'
require 'byebug'

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right, :parent

  def initialize(val, left = nil, right = nil, parent = nil)
    @val = val
    @left = left
    @right = right
    @parent = parent
  end
end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  return root if p.val == root.val || q.val == root.val

  if p.val < root.val && q.val > root.val || p.val > root.val && q.val < root.val
    root
  elsif p.val < root.val && q.val < root.val
    lowest_common_ancestor(root.left, p, q)
  elsif p.val > root.val && q.val > root.val
    lowest_common_ancestor(root.right, p, q)
  else
    raise StandardError, 'Invalid BST'
  end
end

describe 'solution' do
  let(:node1) { TreeNode.new(1) }
  let(:node2) { TreeNode.new(2) }
  let(:node3) { TreeNode.new(3) }
  let(:node4) { TreeNode.new(4) }

  it 'root' do
    node1.right = node2
    expect(lowest_common_ancestor(node1, node2, node1)).to eq node1
    expect(lowest_common_ancestor(node1, node1, node2)).to eq node1
  end

  it 'siblings' do
    node1.right = node2
    node1.left = node3
    expect(lowest_common_ancestor(node1, node3, node1)).to eq node1
  end

  it 'siblings 2' do
    node1.right = node3
    node1.right.right = node4
    node1.right.left = node3
    expect(lowest_common_ancestor(node1, node3, node4).val).to eq node3.val
  end
end
