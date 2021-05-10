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

def has_path_sum(root, target_sum)
  return false unless root
  return root.val == target_sum if !root.left && !root.right

  new_target_sum = target_sum - root.val
  has_path_sum(root.right, new_target_sum) || has_path_sum(root.left, new_target_sum)
end

describe 'solution' do
  let(:tree) { TreeNode.new(1, TreeNode.new(8, TreeNode.new(1), TreeNode.new(2)), TreeNode.new(11)) }
  it { expect(has_path_sum(TreeNode.new(0), 0)).to eq true }
  it { expect(has_path_sum(TreeNode.new(0), 10)).to eq false }
  it { expect(has_path_sum(tree, 10)).to eq true }
end
