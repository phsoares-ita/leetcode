require 'spec_helper'
require 'byebug'

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# 0,1,2,3,4,5,6,7,8
def delete_nodes(head, m, n)
  nodes = []
  node = head
  while node
    nodes << node
    node = node.next
  end
  pos = m - 1
  while pos < nodes.length
    nodes[pos].next = nodes[pos + n + 1]
    pos += m + n
  end
  head
end

def get_values(head)
  ret = []
  while head
    ret << head.val
    head = head.next
  end
  ret
end

describe 'solution' do
  let(:head) { ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5))))) }
  let(:head_empty) { ListNode.new(0) }

  it { expect(get_values(delete_nodes(head_empty, 1, 1))).to eq [0] }
  it { expect(get_values(delete_nodes(head_empty, 1, 2))).to eq [0] }
  it { expect(get_values(delete_nodes(head, 1, 1))).to eq [1, 3, 5] }
  it { expect(get_values(delete_nodes(head, 2, 1))).to eq [1, 2, 4, 5] }
  it { expect(get_values(delete_nodes(head, 2, 2))).to eq [1, 2, 5] }
  it { expect(get_values(delete_nodes(head, 2, 3))).to eq [1, 2] }
  it { expect(get_values(delete_nodes(head, 2, 4))).to eq [1, 2] }
  it { expect(get_values(delete_nodes(head, 3, 1))).to eq [1, 2, 3, 5] }
  it { expect(get_values(delete_nodes(head, 3, 2))).to eq [1, 2, 3] }
end
