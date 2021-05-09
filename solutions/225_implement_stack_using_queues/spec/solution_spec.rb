require 'spec_helper'
require 'byebug'

class MyStack
  # =begin
  #     Initialize your data structure here.
  # =end
  def initialize
    @queue1 = []
    @queue2 = []
  end

  # =begin
  #     Push element x onto stack.
  #     :type x: Integer
  #     :rtype: Void
  # =end
  def push(x)
    @queue2 = @queue1
    @queue1 = []
    @queue1.insert(0, x)
    @queue1 << @queue2.shift until @queue2.empty?
  end

  # =begin
  #     Removes the element on top of the stack and returns that element.
  #     :rtype: Integer
  # =end
  def pop
    @queue1.shift
  end

  # =begin
  #     Get the top element.
  #     :rtype: Integer
  # =end
  def top
    @queue1.first
  end

  # =begin
  #     Returns whether the stack is empty.
  #     :rtype: Boolean
  # =end
  def empty
    @queue1.empty?
  end
end

# Your MyStack object will be instantiated and called as such:
# obj = MyStack.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.empty()

describe 'solution' do
  let(:obj) { MyStack.new }
  it 'should work as stack' do
    expect(obj.empty).to eq true

    obj.push(10)
    expect(obj.empty).to eq false
    expect(obj.top).to eq 10

    obj.push(20)
    expect(obj.empty).to eq false
    expect(obj.top).to eq 20
    expect(obj.pop).to eq 20
    expect(obj.pop).to eq 10
    expect(obj.empty).to eq true
  end
end
