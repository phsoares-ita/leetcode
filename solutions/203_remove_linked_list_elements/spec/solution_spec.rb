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
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)
  nodes = read_nodes(head)
  nodes.reject! { |x| x.val == val }
  (0...nodes.length).each { |index| nodes[index].next = nodes[index + 1] }
  nodes.first
end

def read_nodes(head)
  nodes = []
  while head
    nodes << head
    head = head.next
  end
  nodes
end

def get_non_value_next_node(node, val)
  while node
    return node if node.val != val

    node = node.next
  end
  nil
end

def read_values(head)
  ret = []
  while head
    ret << head.val
    head = head.next
  end
  ret
end

def build_linked_list(arr)
  list = arr.map { |x| ListNode.new(x) }
  head = list.shift
  node = head
  while node
    node.next = list.shift
    node = node.next
  end
  head
end

describe 'solution' do
  it 'removes target element' do
    head = build_linked_list([1, 2, 6, 3, 4, 5, 6])
    ret = remove_elements(head, 6)
    expect(read_values(ret)).to eq [1, 2, 3, 4, 5]
  end

  it 'removes target element at head 1' do
    head = build_linked_list([6, 2, 6, 3, 4, 5, 6])
    ret = remove_elements(head, 6)
    expect(read_values(ret)).to eq [2, 3, 4, 5]
  end

  it 'removes target element at head 2' do
    head = build_linked_list([6, 6, 6, 3, 4, 5, 6])
    ret = remove_elements(head, 6)
    expect(read_values(ret)).to eq [3, 4, 5]
  end

  it 'removes target element at head 3' do
    head = build_linked_list([6, 2, 6, 6, 4, 5, 6])
    ret = remove_elements(head, 6)
    expect(read_values(ret)).to eq [2, 4, 5]
  end
end
