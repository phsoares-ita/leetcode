require 'spec_helper'
require 'byebug'

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right, :level

  def initialize(val = 0, left = nil, right = nil, level = nil)
    @val = val
    @left = left
    @right = right
    @level = level
  end
end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  return false unless root

  levels = [[root]]
  until levels.last.compact.empty?
    next_level = []
    levels.last.each do |node|
      next_level << node&.left
      next_level << node&.right
    end
    levels << next_level
  end

  val_levels = levels.map { |level| level.map { |x| x&.val } }
  val_levels[1..].all? { |level| level.length.even? && level == level.reverse }
end

describe 'solution' do
  let(:root1) { TreeNode.new(1) }
  it { expect(is_symmetric(root1)).to eq true }

  let(:root2) { TreeNode.new(1, TreeNode.new(2)) }
  it { expect(is_symmetric(root2)).to eq false }

  let(:root3) { TreeNode.new(1, TreeNode.new(2), TreeNode.new(3)) }
  it { expect(is_symmetric(root3)).to eq false }

  let(:root4) { TreeNode.new(1, TreeNode.new(2), TreeNode.new(2)) }
  it { expect(is_symmetric(root4)).to eq true }

  let(:root5) { TreeNode.new(1, TreeNode.new(2, TreeNode.new(3)), TreeNode.new(2, TreeNode.new(3))) }
  it { expect(is_symmetric(root5)).to eq false }

  let(:root6) { TreeNode.new(1, TreeNode.new(2, TreeNode.new(3)), TreeNode.new(2, nil, TreeNode.new(3))) }
  it { expect(is_symmetric(root6)).to eq true }
end
