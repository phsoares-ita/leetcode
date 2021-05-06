require 'spec_helper'
require 'byebug'

class MovingAverage
  def initialize(size)
    @size = size
    @current_pos = 0
    @arr = Array.new(size, nil)
  end

  def next(val)
    if @current_pos == @size
      @arr.shift
      @arr << val
    else
      @arr[@current_pos] = val
      @current_pos += 1
    end
    @arr.compact.sum.to_f / @current_pos
  end
end

describe 'solution' do
  let(:obj) { MovingAverage.new(4) }
  it 'with one element' do
    expect(obj.next(1)).to eq 1
    expect(obj.next(2)).to eq 1.5
    expect(obj.next(3)).to eq 2
    expect(obj.next(4)).to eq 2.5
    expect(obj.next(7)).to eq 4
  end
end
