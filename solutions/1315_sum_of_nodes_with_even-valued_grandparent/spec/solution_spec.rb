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
def sum_even_grandparent(root)
  return 0 unless root

  nodes_to_sum = dfs(root, [])
  nodes_to_sum.map(&:val).sum
end

def dfs(root, nodes_to_sum)
  return nodes_to_sum unless root

  if root.val.even?
    new_nodes = [root.left&.left, root.left&.right, root.right&.left, root.right&.right].compact
    nodes_to_sum.concat(new_nodes)
  end
  dfs(root.left, nodes_to_sum)
  dfs(root.right, nodes_to_sum)

  nodes_to_sum
end

describe 'solution' do
  let(:root) { TreeNode.new(1, TreeNode.new(2, TreeNode.new(3, TreeNode.new(4)))) }
  it { expect(sum_even_grandparent(root)).to eq 4 }
end
