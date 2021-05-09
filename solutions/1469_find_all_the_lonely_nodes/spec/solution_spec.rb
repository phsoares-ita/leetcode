require 'spec_helper'
require 'byebug'

class ListNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @right = right
    @left = left
  end
end

# @param {TreeNode} root
# @return {Integer[]}
def get_lonely_nodes(root, ret = [])
  return unless root

  if root.left && !root.right
    ret << root.left.val
  elsif root.right && !root.left
    ret << root.right.val
  end

  get_lonely_nodes(root.left, ret)
  get_lonely_nodes(root.right, ret)

  ret
end

describe 'solution' do
  it { expect(get_lonely_nodes(ListNode.new(1))).to eq [] }
  it { expect(get_lonely_nodes(ListNode.new(1, ListNode.new(2)))).to eq [2] }
  it { expect(get_lonely_nodes(ListNode.new(1, ListNode.new(2), ListNode.new(3)))).to eq [] }
  it { expect(get_lonely_nodes(ListNode.new(1, ListNode.new(2, ListNode.new(4)), ListNode.new(3)))).to eq [4] }
end
