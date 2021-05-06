require 'spec_helper'
require 'byebug'

class ListNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# @param {TreeNode} root
# @param {Integer} low
# @param {Integer} high
# @return {Integer}
def range_sum_bst(root, low, high)
    return 0 unless root

    if root.val >= low && root.val <= high
      ret = root.val
    else
      ret = 0
    end
    ret + range_sum_bst(root.left, low, high) + range_sum_bst(root.right, low, high)
end

describe 'solution' do
  it 'should work with one node' do
    actual = range_sum_bst(ListNode.new(10), 0, 10)
    expect(actual).to eq(10)
  end

  it 'should work with two nodes inside the range' do
    actual = range_sum_bst(ListNode.new(10, ListNode.new(1)), 0, 10)
    expect(actual).to eq(11)
  end
  
  it 'should work with two node and one inside the range' do
    actual = range_sum_bst(ListNode.new(10, ListNode.new(11)), 0, 10)
    expect(actual).to eq(10)
  end
end
