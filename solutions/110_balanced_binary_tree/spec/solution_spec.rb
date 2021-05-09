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
# @return {Boolean}
def is_balanced(root)
  return true unless root

  left_height = calculate_height(root.left)
  right_height = calculate_height(root.right)
  height_diff = (left_height - right_height).abs

  height_diff <= 1 && is_balanced(root.left) && is_balanced(root.right)
end

def calculate_height(node)
  return -1 unless node

  1 + [calculate_height(node.left), calculate_height(node.right)].max
end

describe 'solution' do
  let(:root1) { TreeNode.new(1, TreeNode.new(2), TreeNode.new(3)) }
  let(:root2) { TreeNode.new(1, TreeNode.new(2), TreeNode.new(3, TreeNode.new(4))) }
  let(:root3) { TreeNode.new(1, TreeNode.new(2), TreeNode.new(3, TreeNode.new(4, TreeNode.new(5)))) }

  it { expect(is_balanced(root1)).to eq true }
  it { expect(is_balanced(root2)).to eq true }
  it { expect(is_balanced(root3)).to eq false }
end
