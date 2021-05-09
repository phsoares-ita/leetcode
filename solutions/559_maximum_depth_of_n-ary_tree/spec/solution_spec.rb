require 'spec_helper'
require 'byebug'

# Definition for a Node.
class Node
    attr_accessor :val, :children
    def initialize(val)
        @val = val
        @children = []
    end
end

# @param {Node} root
# @return {int}
def maxDepth(root)
  return 0 unless root

  children_depth = root.children.map { |x| maxDepth(x) }
  return 1 if children_depth.empty?

  1 + children_depth.max
end

describe 'solution' do
  let(:only_root) { Node.new(1) }
  let(:level2) { node = Node.new(1); node.children << Node.new(2); node }
  it { expect(maxDepth(only_root)).to eq 1 }
  it { expect(maxDepth(level2)).to eq 2 }
end
