require 'spec_helper'
require 'byebug'

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  return 0 unless root
  children = [root.left, root.right]
  children_depth = children.map { |node| max_depth(node) }
  max_children_depth = children_depth.max || 0 
  1 + max_children_depth
end

