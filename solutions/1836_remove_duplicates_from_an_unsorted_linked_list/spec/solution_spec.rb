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
def delete_duplicates_unsorted(head)
  nodes = read_nodes(head)
  count = count_nodes(head)
  not_repeated_nodes = list_not_repeated_nodes(nodes, count)
  rebuild_linked_list(not_repeated_nodes)
end

def rebuild_linked_list(nodes_array)
  (0...nodes_array.length).each do |index|
    nodes_array[index].next = nodes_array[index + 1]
  end
  nodes_array.first
end

def list_not_repeated_nodes(node_list, count)
  ret = []
  node_list.each do |node|
    next if count[node.val] > 1

    ret << node
  end
  ret
end

def count_nodes(head)
  count = {}
  while head
    count[head.val] ||= 0
    count[head.val] += 1
    head = head.next
  end
  count
end

def read_nodes(head)
  ret = []
  while head
    ret << head
    head = head.next
  end
  ret
end

describe 'solution' do
  let(:list1) { ListNode.new(1, ListNode.new(2, ListNode.new(2))) }
  it { expect(delete_duplicates_unsorted(list1).val).to eq 1 }
  it { expect(delete_duplicates_unsorted(list1).next).to eq nil }
end
