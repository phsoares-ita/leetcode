require 'spec_helper'
require 'byebug'

# You must use only standard operations of a stack, which means only push to top, peek/pop from top, size,
# and is empty operations are valid.
class MyQueue
  # =begin
  #     Initialize your data structure here.
  # =end
  def initialize
    @stack1 = []
    @stack2 = []
  end

  # =begin
  #     Push element x to the back of queue.
  #     :type x: Integer
  #     :rtype: Void
  # =end
  def push(x)
    @stack1 << x
  end

  # =begin
  #     Removes the element from in front of queue and returns that element.
  #     :rtype: Integer
  # =end
  def pop
    @stack2 << @stack1.pop until @stack1.empty?
    ret = @stack2.pop
    @stack1 << @stack2.pop until @stack2.empty?
    ret
  end

  # =begin
  #     Get the front element.
  #     :rtype: Integer
  # =end
  def peek
    @stack2 << @stack1.pop until @stack1.empty?
    ret = @stack2.last
    @stack1 << @stack2.pop until @stack2.empty?
    ret
  end

  #     =begin
  #     Returns whether the queue is empty.
  #     :rtype: Boolean
  # =end
  def empty
    @stack1.empty?
  end
end

# Your MyQueue object will be instantiated and called as such:
# obj =
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.peek()
# param_4 = obj.empty()

describe 'solution' do
  let(:obj) { MyQueue.new }

  it 'works as queue' do
    expect(obj.empty).to eq true

    obj.push(10)
    obj.push(11)
    expect(obj.empty).to eq false

    expect(obj.peek).to eq 10
    expect(obj.empty).to eq false

    expect(obj.pop).to eq 10
    expect(obj.peek).to eq 11
    expect(obj.empty).to eq false

    expect(obj.pop).to eq 11
    expect(obj.empty).to eq true
  end
end
