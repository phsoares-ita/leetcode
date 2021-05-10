require 'spec_helper'
require 'byebug'

# Definition for a Node.
class Node
  attr_accessor :val, :left, :right, :parent

  def initialize(val = 0, _left = nil, _right = nil, _parent = nil)
    @val = val
    @left = nil
    @right = nil
    @parent = nil
  end
end

# @param {Node} root
# @return {Node}
def lowest_common_ancestor(p, q)
  visited = {}
  while p || q
    if p
      return p if visited[p]

      visited[p] = true
      p = p.parent
    end
    next unless q
    return q if visited[q]

    visited[q] = true
    q = q.parent
  end
  raise StandardError, 'Parent not found'
end

describe 'solution' do
  let(:node1) { Node.new(1) }
  let(:node2) { Node.new(2) }
  let(:node3) { Node.new(3) }

  before do
    node1.left = node2
    node2.parent = node1

    node1.right = node3
    node3.parent = node1
  end

  it { expect(lowest_common_ancestor(node1, node1)).to eq node1 }
  it { expect(lowest_common_ancestor(node1, node2)).to eq node1 }
  it { expect(lowest_common_ancestor(node3, node2)).to eq node1 }
end
