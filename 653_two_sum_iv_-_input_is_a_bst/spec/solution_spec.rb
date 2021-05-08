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

# root.val > root.left.val
# root.val < root.right.val
# 2*root < target => solution must be in right

def find_target(root, k)
  return false unless root

  nodes = dfs(root, {})
  nodes.any? { |val, _| (k - val != val && nodes[k - val]) }
end

def dfs(root, nodes)
  return nodes unless root

  nodes[root.val] = true
  dfs(root.left, nodes)
  dfs(root.right, nodes)
  nodes
end

describe 'solution' do
  context 'single node' do
    let(:root) { TreeNode.new(1) }
    it { expect(find_target(root, 1)).to eq false }
  end

  context 'two nodes' do
    let(:root) { TreeNode.new(1, TreeNode.new(3)) }
    it { expect(find_target(root, 1)).to eq false }
    it { expect(find_target(root, 4)).to eq true }
  end

  context 'tree nodes' do
    let(:root) { TreeNode.new(1, TreeNode.new(3), TreeNode.new(5)) }
    it { expect(find_target(root, 10)).to eq false }
    it { expect(find_target(root, 4)).to eq true }
  end
end
