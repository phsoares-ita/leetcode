require 'spec_helper'
require 'byebug'

class FullUseManagerException < StandardError
end

class ListNode
  attr_accessor :val, :next, :previous
  def initialize(val = 0, _next = nil, _previous = nil)
    @val = val
    @next = _next
    @previous = _previous
  end
end

class LLUseManager
  def initialize(capacity)
    @capacity = capacity
    @keys = {}
    @head = nil
    @tail = nil
  end

  def use(key)
    raise FullUseManagerException if !exists?(key) && full?

    delete(key) if exists?(key)
    add_node_to_tail(key)
  end

  def exists?(key)
    !!@keys[key]
  end

  def full?
    @keys.keys.length == @capacity
  end

  def least_used_key
    @head&.val
  end

  def delete(key)
    node = @keys[key]
    @keys.delete(key)
    delete_node_from_double_linked_list(node)
  end

  private

  def add_node_to_tail(value)
    node = ListNode.new(value)
    if @tail
      @tail.next = node
      node.previous = @tail
    else
      @head = node
    end
    @tail = node
    @keys[value] = node
  end

  def delete_node_from_double_linked_list(node)
    raise StandardError, 'Node not found' unless node
    raise StandardError, 'List is empty' unless @head && @tail

    prev_node = node.previous
    next_node = node.next

    if prev_node
      prev_node.next = next_node
    else
      @head = next_node
      @head.previous = nil if @head
    end

    if next_node
      next_node.previous = prev_node
    else
      @tail = prev_node
      @tail.next = nil if @tail
    end
  end
end

class MapUseManager
  def initialize(capacity)
    @capacity = capacity
    @keys = {}
    @use_count = 0
  end

  def use(key)
    raise FullUseManagerException if !exists?(key) && full?

    @keys[key] = (@use_count += 1)
  end

  def exists?(key)
    !!@keys[key]
  end

  def full?
    @keys.keys.length == @capacity
  end

  def least_used_key
    min_count = @keys.values.min
    @keys.select { |_, v| v == min_count }.keys.first
  end

  def delete(key)
    @keys.delete(key)
  end
end

class LRUCache
  def initialize(capacity, use_manager)
    @capacity = capacity
    @map = {}
    @use_manager = use_manager
  end

  def get(key)
    ret = @map[key]
    @use_manager.use(key) if ret
    ret || -1
  end

  def put(key, value)
    if !@use_manager.exists?(key) && @use_manager.full?
      least_used_key = @use_manager.least_used_key
      @use_manager.delete(least_used_key)
      @map.delete(least_used_key)
    end
    @map[key] = value
    @use_manager.use(key)
  end
end

describe LRUCache do
  context 'below capacity' do
    it 'works as cache - updating key does not drop existing ones when capacity is reached' do
      use_manager = LLUseManager.new(2)
      cache = LRUCache.new(2, use_manager)
      expect(cache.get(1)).to eq(-1)

      cache.put(1, 10)
      expect(cache.get(1)).to eq(10)

      cache.put(2, 20)
      expect(cache.get(2)).to eq(20)
      expect(cache.get(1)).to eq(10)

      cache.put(1, 5)
      expect(cache.get(1)).to eq(5)
      expect(cache.get(2)).to eq(20)
    end
  end

  context 'with full capacity' do
    it 'adding new key should evict least used one' do
      use_manager = LLUseManager.new(2)
      cache = LRUCache.new(2, use_manager)
      cache.put(1, 10) # 1
      cache.put(2, 20) # 2 1
      expect(cache.get(1)).to eq(10) # 1 2
      cache.put(3, 30) # 3 1
      expect(cache.get(1)).to eq(10) # 1 3
      expect(cache.get(3)).to eq(30) # 3 1
      expect(cache.get(2)).to eq(-1) # 3 1
      cache.put(4, 40) # 4 3
      expect(cache.get(3)).to eq(30)
      expect(cache.get(4)).to eq(40)
      expect(cache.get(2)).to eq(-1)
      expect(cache.get(1)).to eq(-1)
    end
  end
end
