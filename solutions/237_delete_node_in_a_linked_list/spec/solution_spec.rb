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

# @param {ListNode} node
# @return {Void} Do not return anything, modify node in-place instead.
def delete_node(node)
  while node.next
    node.val = node.next.val
    if !node.next.next
      node.next = nil
      break
    else
      node = node.next
    end
  end
end

describe 'solution' do
  let(:head1) { ListNode.new(1, ListNode.new(2)) }
  let(:head2) { ListNode.new(1, ListNode.new(2, ListNode.new(3))) }

  it 'works with 2 nodes' do
    delete_node(head1)
    expect(head1.val).to eq(2)
    expect(head1.next).to eq(nil)
  end

  it 'works with 3 nodes deleting first one' do
    delete_node(head2)
    expect(head2.val).to eq(2)
    expect(head2.next.val).to eq(3)
  end

  it 'works with 3 nodes deleting second one' do
    delete_node(head2.next)
    expect(head2.val).to eq(1)
    expect(head2.next.val).to eq(3)
  end
end
