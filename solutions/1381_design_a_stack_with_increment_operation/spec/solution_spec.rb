require 'spec_helper'
require 'byebug'

class CustomStack
  # =begin
  #     :type max_size: Integer
  # =end
  def initialize(max_size)
    @max_size = max_size
    @arr = []
  end

  # =begin
  #     :type x: Integer
  #     :rtype: Void
  # =end
  def push(x)
    @arr << x if @arr.length < @max_size
  end

  # =begin
  #     :rtype: Integer
  # =end
  def pop
    @arr.pop || -1
  end

  # =begin
  #     :type k: Integer
  #     :type val: Integer
  #     :rtype: Void
  # =end
  def increment(k, val)
    last_index = [k, @arr.length].min
    (0...last_index).each do |index|
      @arr[index] += val
    end
  end
end

# Your CustomStack object will be instantiated and called as such:
# obj = CustomStack.new(max_size)
# obj.push(x)
# param_2 = obj.pop()
# obj.increment(k, val)

describe 'solution' do
  let(:obj) { CustomStack.new(2) }

  it 'works as intended' do
    obj.push(10)
    obj.push(11)
    obj.push(12)
    expect(obj.pop).to eq(11)
    expect(obj.pop).to eq(10)
    expect(obj.pop).to eq(-1)

    obj.push(8)
    obj.push(9)
    obj.increment(2, 1)
    obj.increment(1, 1)
    expect(obj.pop).to eq(10)
    expect(obj.pop).to eq(10)
    expect(obj.pop).to eq(-1)
  end
end
