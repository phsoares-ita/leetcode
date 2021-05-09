require 'spec_helper'
require 'byebug'

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
  visited = {}
  while head
    return true if visited[head]

    visited[head] = true
    head = head.next
  end
  false
end

describe 'solution' do
  let(:head) { ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4)))) }
  it 'returns false if there is no cycle' do
    expect(hasCycle(head)).to eq false
  end

  it 'returns true if there is a cycle' do
    node2 = head.next
    node4 = node2.next.next
    node4.next = node2
    expect(hasCycle(head)).to eq true
  end
end
