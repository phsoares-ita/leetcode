require 'spec_helper'
require 'byebug'

class ListNode
  attr_accessor :val, :next

  def initialize(val, _next = nil)
    @val = val
    @next = _next
  end
end

def add_two_numbers(l1, l2)
  head = nil
  last_node = nil
  carry = 0
  while l1 || l2 || carry > 0
    digit, carry = sum_values(l1, l2, carry)
    node = ListNode.new(digit)
    head ||= node
    last_node.next = node if last_node
    last_node = node
    l1 = l1&.next
    l2 = l2&.next
  end
  head
end

def sum_values(l1, l2, carry)
  sum = (l1&.val || 0) + (l2&.val || 0) + carry
  [sum % 10, sum / 10]
end

describe 'solution' do
  context 'with carry' do
    before do
      @l1 = ListNode.new(1)
      @l2 = ListNode.new(9)
    end

    it { expect(add_two_numbers(@l1, @l2).val).to eq 0 }
    it { expect(add_two_numbers(@l1, @l2).next.val).to eq 1 }
  end

  context 'without carry' do
    before do
      @l1 = ListNode.new(1)
      @l2 = ListNode.new(8)
    end

    it { expect(add_two_numbers(@l1, @l2).val).to eq 9 }
    it { expect(add_two_numbers(@l1, @l2).next).to eq nil }
  end

  context 'different sizes' do
    before do
      @l1 = ListNode.new(1)
      @l2 = ListNode.new(8, ListNode.new(7))
    end

    it { expect(add_two_numbers(@l1, @l2).val).to eq 9 }
    it { expect(add_two_numbers(@l1, @l2).next.val).to eq 7 }
  end

  context 'problem example' do
    before do
      @l1 = ListNode.new(2, ListNode.new(4, ListNode.new(3)))
      @l2 = ListNode.new(5, ListNode.new(6, ListNode.new(4)))
    end

    it { expect(add_two_numbers(@l1, @l2).val).to eq 7 }
    it { expect(add_two_numbers(@l1, @l2).next.val).to eq 0 }
    it { expect(add_two_numbers(@l1, @l2).next.next.val).to eq 8 }
  end
end