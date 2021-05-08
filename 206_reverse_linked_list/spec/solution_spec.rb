require 'spec_helper'
require 'byebug'

class ListNode
  attr_accessor :val, :next
  
  def initialize(val, _next = nil)
    @val = val
    @next = _next
  end
end

def reverse_list(head)
  return head unless head

  node = head
  nodes = []
  while node
    nodes << node
    node = node.next
  end
  (0...nodes.length).each do |i|
    next_node = i == nodes.length - 1 ? nil : nodes[nodes.length - i - 2]
    nodes[nodes.length - i - 1].next = next_node
  end
  nodes.last
end

describe 'reverse_list' do
  let(:head) { ListNode.new(1, ListNode.new(2, ListNode.new(3))) }
  it { expect(reverse_list(head).val).to eq 3 }
  it { expect(reverse_list(head).next.val).to eq 2 }
  it { expect(reverse_list(head).next.next.val).to eq 1 }
  it { expect(reverse_list(head).next.next.next).to eq nil }
end
