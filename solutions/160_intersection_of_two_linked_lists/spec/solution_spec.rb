require 'spec_helper'
require 'byebug'

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} headA
# @param {ListNode} headB
# @return {ListNode}
def getIntersectionNode(headA, headB)
  node_count = {}
  while headA || headB
    if headA
      node_count[headA] ||= 0
      node_count[headA] += 1
      return headA if node_count[headA] > 1
      headA = headA&.next
    end

    if headB
      node_count[headB] ||= 0
      node_count[headB] += 1
      return headB if node_count[headB] > 1
      headB = headB&.next
    end
  end
end

describe 'solution' do
  let(:node1) { ListNode.new(1) }
  let(:node2) { ListNode.new(2) }
  let(:node3) { ListNode.new(3) }

  it 'without intersection' do
    expect(getIntersectionNode(node1, node2)).to eq(nil)
  end

  it 'with same node' do
    expect(getIntersectionNode(node1, node1)).to eq(node1)
  end

  it 'with other intersection' do
    node1.next = node2.next = node3
    expect(getIntersectionNode(node1, node2)).to eq(node3)
  end
end
