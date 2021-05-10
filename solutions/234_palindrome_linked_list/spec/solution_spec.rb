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
# @return {Boolean}
def is_palindrome(head)
  return true unless head

  values = []
  while head
    values << head.val
    head = head.next
  end
  values == values.reverse
end

describe 'solution' do
  let(:list1) { ListNode.new(1, ListNode.new(2, ListNode.new(3))) }
  let(:list2) { ListNode.new(1, ListNode.new(2, ListNode.new(1))) }
  it { expect(is_palindrome(list1)).to eq false }
  it { expect(is_palindrome(list2)).to eq true }
end
