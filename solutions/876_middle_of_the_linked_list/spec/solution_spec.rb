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

# @param {ListNode} head
# @return {ListNode}
def middle_node(head)
  ret = []
  node = head
  while node
    ret << node
    node = node.next
  end
  mid_pos = ret.length / 2
  ret[mid_pos]
end

describe 'solution' do
  let(:head1) { ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4)))) }
  let(:head2) { ListNode.new(1, ListNode.new(2, ListNode.new(3))) }
  it { expect(middle_node(head1).val).to eq 3 }
  it { expect(middle_node(head2).val).to eq 2 }
end
