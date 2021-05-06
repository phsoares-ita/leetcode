require 'spec_helper'
require 'byebug'

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} head
# @return {Integer}
def get_decimal_value(head)
  ret = []
  while head
    ret.push(head.val)
    head = head.next
  end
  ret.join.to_i(2)
end

describe 'solution' do
  it { expect(get_decimal_value(ListNode.new(1))).to eq 1 }
  it { expect(get_decimal_value(ListNode.new(1, ListNode.new(0)))).to eq 2 }
  it { expect(get_decimal_value(ListNode.new(1, ListNode.new(1)))).to eq 3 }
end
