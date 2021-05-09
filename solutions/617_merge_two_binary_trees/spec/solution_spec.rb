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

def merge_trees(root1, root2)
  return nil unless root2 || root1
  return root2 unless root1
  return root1 unless root2

  ret = TreeNode.new(root1.val + root2.val)
  ret.left = merge_trees(root1.left, root2.left)
  ret.right = merge_trees(root1.right, root2.right)
  ret
end

describe 'solution' do
  let(:root1) { TreeNode.new(1) }
  let(:root2) {}
  let(:root3) { TreeNode.new(3, TreeNode.new(3))}
  it { expect(merge_trees(root1, root2)).to eq root1 }
  it { expect(merge_trees(root1, root3).val).to eq 4 }
  it { expect(merge_trees(root1, root3).left.val).to eq 3 }
end
