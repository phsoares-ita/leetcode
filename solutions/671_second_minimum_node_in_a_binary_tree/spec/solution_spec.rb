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
def find_second_minimum_value(root)
  return -1 unless root

  queue = [root]
  values = [root.val]
  until queue.empty?
    node = queue.shift
    values << node.val
    queue << node.left if node.left
    queue << node.right if node.right
  end
  values = values.uniq.sort
  values[1] || -1
end

describe 'solution' do
  let(:root) { TreeNode.new(2, TreeNode.new(2), TreeNode.new(3)) }
  it { expect(find_second_minimum_value(TreeNode.new(1))).to eq(-1) }
  it { expect(find_second_minimum_value(root)).to eq 3 }
end
