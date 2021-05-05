require 'spec_helper'
require 'byebug'

class TreeNode
  attr_accessor :val, :left, :right, :level

  def initialize(val = 0, _left = nil, _right = nil)
    @val = val
    @left = _left
    @right = _right
  end
end

def zigzag_level_order(root)
  return [] unless root

  root.level = 0
  levels = []
  dfs(root, levels)
  (0...levels.length).each do |i|
    next if i.even?

    levels[i] = levels[i].reverse
  end
  levels
end

def dfs(node, levels)
  return node unless node

  levels[node.level] ||= []
  levels[node.level] << node.val
  if node.left
    node.left.level = node.level + 1
    dfs(node.left, levels)
  end

  if node.right
    node.right.level = node.level + 1
    dfs(node.right, levels)
  end
end

describe 'solution' do
  context 'three levels' do
    before do
      @root = TreeNode.new(1,
                           TreeNode.new(2, TreeNode.new(4), TreeNode.new(5)),
                           TreeNode.new(3, TreeNode.new(6), TreeNode.new(7)))
    end

    it { expect(zigzag_level_order(@root)).to eq([[1], [3, 2], [4, 5, 6, 7]]) }
  end
end
