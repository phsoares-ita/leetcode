require 'spec_helper'
require 'byebug'

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def add_two_numbers(l1, l2)
    carry = 0
    head = nil
    last_node = nil
    while l1 || l2 || carry > 0
      sum = (l1&.val || 0) + (l2&.val || 0) + carry
      digit = sum % 10
      carry = sum / 10
      node = ListNode.new(digit)

      last_node.next = node if last_node
      last_node = node
      head ||= node

      l1 = l1&.next
      l2 = l2&.next
    end
    head
end

describe 'solution' do
  it 'adds two single digit nums without carry' do
    l1 = ListNode.new(1)
    l2 = ListNode.new(3)
    expect(add_two_numbers(l1, l2).val).to eq 4
  end

  it 'adds two single digit nums with carry' do
    l1 = ListNode.new(3)
    l2 = ListNode.new(9)
    expect(add_two_numbers(l1, l2).val).to eq 2
    expect(add_two_numbers(l1, l2).next.val).to eq 1
  end

  it 'adds two nums with carry' do
    l1 = ListNode.new(3)
    l2 = ListNode.new(9, ListNode.new(9))
    expect(add_two_numbers(l1, l2).val).to eq 2
    expect(add_two_numbers(l1, l2).next.val).to eq 0
    expect(add_two_numbers(l1, l2).next.next.val).to eq 1
  end

  it 'adds two complex nums with carry' do
    l1 = ListNode.new(9, ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(8, ListNode.new(2))))))
    l2 = ListNode.new(8, ListNode.new(3, ListNode.new(7, ListNode.new(2))))
    expect(add_two_numbers(l1, l2).val).to eq 7
    expect(add_two_numbers(l1, l2).next.val).to eq 5
    expect(add_two_numbers(l1, l2).next.next.val).to eq 9
    expect(add_two_numbers(l1, l2).next.next.next.val).to eq 5
    expect(add_two_numbers(l1, l2).next.next.next.next.val).to eq 8
    expect(add_two_numbers(l1, l2).next.next.next.next.next.val).to eq 2
  end
end
