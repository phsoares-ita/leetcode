require 'spec_helper'
require 'byebug'

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  return nil unless l1 || l2

  ret = nil
  last_node = nil
  while l1 || l2
    if (l1 && l2 && l1.val < l2.val) || !l2
      node = ListNode.new(l1.val)
      l1 = l1.next
    else
      node = ListNode.new(l2.val)
      l2 = l2.next
    end
    last_node.next = node if last_node
    last_node = node
    ret ||= node
  end
  ret
end

describe 'solution' do
  let(:head1) { ListNode.new(2, ListNode.new(4)) }
  let(:head2) { ListNode.new(1, ListNode.new(3, ListNode.new(5))) }
  it { expect(merge_two_lists(head1, head2).val).to eq 1 }
  it { expect(merge_two_lists(head1, head2).next.val).to eq 2 }
  it { expect(merge_two_lists(head1, head2).next.next.val).to eq 3 }
  it { expect(merge_two_lists(head1, head2).next.next.next.val).to eq 4 }
  it { expect(merge_two_lists(head1, head2).next.next.next.next.val).to eq 5 }
end
