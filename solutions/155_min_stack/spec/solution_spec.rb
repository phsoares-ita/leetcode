require 'spec_helper'
require 'byebug'

class MinStack
  # =begin
  #     initialize your data structure here.
  # =end
  def initialize
    @min_stack = []
    @stack = []
  end

  # =begin
  #     :type val: Integer
  #     :rtype: Void
  # =end
  def push(val)
    @stack << val
    if @min_stack.empty? || val >= @min_stack.last
      @min_stack.push(val)
    elsif val <= @min_stack.first
      @min_stack.insert(0, val)
    else
      (0...(@min_stack.size - 1)).each do |index|
        if val >= @min_stack[index] && val < @min_stack[index + 1]
          @min_stack.insert(index + 1, val)
          break
        end
      end
    end
  end

  # =begin
  #     :rtype: Void
  # =end
  def pop
    @stack.shift
  end

  # =begin
  #     :rtype: Integer
  # =end
  def top
    @stack.last
  end

  # =begin
  #     :rtype: Integer
  # =end
  def get_min
    @stack.first
  end
end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()

describe 'solution' do
  let(:min_stack) { MinStack.new }

  it 'works as min stack' do
    min_stack.push(-2)
    min_stack.push(0)
    min_stack.push(-1)

    expect(min_stack.get_min).to eq(-2)
    expect(min_stack.top).to eq(0)
    expect(min_stack.pop).to eq(-2)
    expect(min_stack.get_min).to eq(-1)
  end
end
