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
# @return {Integer}
def good_nodes(root, max_value = nil)
  return 0 unless root

  max_value = [max_value, root.val].compact.max
  l = good_nodes(root&.left, max_value)
  r = good_nodes(root&.right, max_value)
  count = max_value > root.val ? 0 : 1
  count + l + r
end

describe 'solution' do
  let(:tree) { TreeNode.new(3, TreeNode.new(2), TreeNode.new(5)) }
  it { expect(good_nodes(tree)).to eq 2 }

  let(:tree2) do
    TreeNode.new(3,
                 TreeNode.new(2, TreeNode.new(1), TreeNode.new(7)),
                 TreeNode.new(5, TreeNode.new(8)))
  end
  it { expect(good_nodes(tree2)).to eq 4 }
end

#     3
#  2     5
# 1 7   8
