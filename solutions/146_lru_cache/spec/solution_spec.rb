require 'spec_helper'
require 'byebug'

class LRUCache
  # =begin
  #     :type capacity: Integer
  # =end
  def initialize(capacity)
    @capacity = capacity
    @values = {}
  end

  # =begin
  #     :type key: Integer
  #     :rtype: Integer
  # =end
  def get(key)
    ret = @values[key]
    return -1 unless ret

    @values.delete(key)
    @values[key] = ret
    ret
  end

  # =begin
  #     :type key: Integer
  #     :type value: Integer
  #     :rtype: Void
  # =end
  def put(key, value)
    if @values[key]
      @values.delete(key)
    elsif @values.keys.length == @capacity
      first_key = @values.keys.first
      @values.delete(first_key)
    end
    @values[key] = value
  end
end

describe 'solution' do
  let(:obj) {  LRUCache.new(2) }
  it 'works as hash until capacity is reached' do
    obj.put(1, 10)
    expect(obj.get(1)).to eq(10)
    expect(obj.get(2)).to eq(-1)

    obj.put(2, 20)
    expect(obj.get(1)).to eq(10)
    expect(obj.get(2)).to eq(20)
  end

  it 'it evicts least used key when multiple puts are made' do
    obj.put(1, 10)
    obj.put(2, 20)
    obj.put(3, 30)
    expect(obj.get(1)).to eq(-1)
    expect(obj.get(2)).to eq(20)
    expect(obj.get(3)).to eq(30)
  end

  it 'it evicts least used key when gets and puts are made' do
    obj.put(1, 10)
    obj.put(2, 20)
    expect(obj.get(1)).to eq(10)
    obj.put(3, 30)
    expect(obj.get(1)).to eq(10)
    expect(obj.get(2)).to eq(-1)
    expect(obj.get(3)).to eq(30)
  end

  it 'it do not evict least used key when its value is changed' do
    obj.put(1, 10)
    obj.put(2, 20)
    obj.put(2, 30)
    expect(obj.get(1)).to eq(10)
    expect(obj.get(2)).to eq(30)
  end
end
