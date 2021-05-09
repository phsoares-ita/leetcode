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
def delete_duplicates(head)
  return head unless head

  node = head
  while node
    if node&.next&.val == node.val
      node.next = node.next.next
    else
      node = node.next
    end
  end
  head
end

describe 'solution' do
  let(:root1) { ListNode.new(1, ListNode.new(1, ListNode.new(2))) }
  it { expect(delete_duplicates(root1).val).to eq 1 }
  it { expect(delete_duplicates(root1).next.val).to eq 2 }

  let(:root2) { ListNode.new(1, ListNode.new(1)) }
  it { expect(delete_duplicates(root2).val).to eq 1 }
  it { expect(delete_duplicates(root2).next).to eq nil }
end
