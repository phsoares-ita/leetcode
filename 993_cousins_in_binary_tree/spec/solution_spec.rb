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

# @param {TreeNode} root
# @param {Integer} x
# @param {Integer} y
# @return {Boolean}
def is_cousins(root, x, y)
  parent = dfs(root, {})
  return false unless parent[x] && parent[parent[x].val]
  return false unless parent[y] && parent[parent[y].val]
  return false if parent[x] == parent[y]

  px = parent[parent[x].val]
  py = parent[parent[y].val]
  while px && py
    return true if px == py

    px = parent[px.val]
    py = parent[py.val]
  end
  false
end

def dfs(root, parent)
  return parent unless root

  if root.left
    parent[root.left.val] = root
    dfs(root.left, parent)
  end
  if root.right
    parent[root.right.val] = root
    dfs(root.right, parent)
  end
  parent
end

describe 'solution' do
  let(:tree) { TreeNode.new(1, TreeNode.new(2, TreeNode.new(4, TreeNode.new(5))), TreeNode.new(3)) }
  it { expect(is_cousins(tree, 2, 3)).to eq false }
end
