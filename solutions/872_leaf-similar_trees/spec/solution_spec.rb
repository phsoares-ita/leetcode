require 'spec_helper'
require 'byebug'

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def leaf_similar(root1, root2)
  leafs1 = []; get_leaf_nodes(root1, leafs1)
  leafs2 = []; get_leaf_nodes(root2, leafs2)
  leafs1 == leafs2
end

def get_leaf_nodes(root, ret = [])
  return ret unless root

  if !root.left && !root.right
    ret << root.val
  else
    get_leaf_nodes(root.left, ret)
    get_leaf_nodes(root.right, ret)
  end
end

describe 'solution' do
  let(:root) { TreeNode.new(1, TreeNode.new(2, TreeNode.new(3)), TreeNode.new(4)) }

  it 'should map leaf' do
    ret = []
    get_leaf_nodes(root, ret)
    expect(ret).to eq [3, 4]
  end
end
