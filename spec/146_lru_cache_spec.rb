require 'spec_helper'
require 'byebug'

class ListNode
  attr_accessor :val, :next, :previous

  def initialize(val = 0, _next = nil, _previous = nil)
    @val = val
    @next = _next
    @previous = _previous
  end
end

class UniqueQueue
  def initialize(capacity)
    @capacity = capacity
    @head = nil
    @tail = nil
    @map = {}
  end

  def enqueue(key)
    ret = nil
    if @map[key]
      remove_key(key)
    elsif @map.keys.length == @capacity
      ret = @head.val
      remove_key(ret)
    end
    add_to_tail(key)
    ret
  end

  private

  def remove_key(key)
    node = @map[key]
    if node == @head
      if @head&.next
        @head = node.next
        @head.previous = nil
      else
        @head = @tail = nil
      end
    else
      node_previous = node.previous
      node_next = node.next
      node_previous.next = node_next
      if node_next
        node_next.previous = node_previous
      else
        @tail = node_previous
      end
    end
    @map.delete(key)
  end

  def add_to_tail(key)
    node = ListNode.new(key)
    if @head
      node.previous = @tail
      @tail.next = node
    else
      @head = node
    end
    @tail = node
    @map[key] = node
  end
end

class LRUCache
  def initialize(capacity)
    @use_queue = UniqueQueue.new(capacity)
    @cache = {}
  end

  # Return the value of the key if the key exists, otherwise return -1.
  def get(key)
    ret = @cache[key]
    return -1 unless ret

    refresh_keys_use(key)
    ret
  end

  # Update the value of the key if the key exists.
  # Otherwise, add the key-value pair to the cache.
  # If the number of keys exceeds the capacity from this operation, evict the least recently used key.
  def put(key, value)
    key_to_remove = refresh_keys_use(key)
    @cache.delete(key_to_remove) if key_to_remove
    @cache[key] = value
  end

  private

  def refresh_keys_use(key)
    @use_queue.enqueue(key)
  end
end

describe UniqueQueue do
  context 'should not remove items when below capacity' do
    before do
      @queue = UniqueQueue.new(2)
    end

    it 'does not return keys to remove' do
      expect(@queue.enqueue(1)).to eq(nil)
      expect(@queue.enqueue(1)).to eq(nil)
      expect(@queue.enqueue(2)).to eq(nil)
    end
  end

  context 'remove items when above capacity' do
    before do
      @queue = UniqueQueue.new(2)
    end

    it 'does not return keys to remove' do
      expect(@queue.enqueue(1)).to eq(nil)
      expect(@queue.enqueue(2)).to eq(nil)
      expect(@queue.enqueue(3)).to eq(1)
      expect(@queue.enqueue(2)).to eq(nil)

      expect(@queue.enqueue(1)).to eq(3)
    end
  end
end

describe 'solution' do
  context 'until cache is full' do
    it 'works as normal cache' do
      cache = LRUCache.new(2)
      expect(cache.get(1)).to eq(-1)
      expect(cache.get(2)).to eq(-1)

      cache.put(1, 1)
      expect(cache.get(1)).to eq(1)
      expect(cache.get(2)).to eq(-1)

      cache.put(2, 2)
      expect(cache.get(1)).to eq(1)
      expect(cache.get(2)).to eq(2)
      expect(cache.get(3)).to eq(-1)
    end
  end

  context 'when capacity is reached' do
    it 'works drops last added key when there is no access' do
      cache = LRUCache.new(2)
      cache.put(1, 1)
      cache.put(2, 2)
      cache.put(3, 3)
      expect(cache.get(1)).to eq(-1)
      expect(cache.get(2)).to eq(2)
      expect(cache.get(3)).to eq(3)
    end

    it 'works drops last added key with access' do
      cache = LRUCache.new(3)
      cache.put(1, 1)
      cache.put(2, 2)
      cache.get(1)
      cache.get(1)
      cache.get(1)
      cache.get(1)
      cache.put(3, 3)
      cache.put(4, 4)
      expect(cache.get(1)).to eq(1)
      expect(cache.get(2)).to eq(-1)
      expect(cache.get(3)).to eq(3)
      expect(cache.get(4)).to eq(4)
    end

    it 'works in problem example' do
      cache = LRUCache.new(2)
      cache.put(1, 1)
      cache.put(2, 2)
      expect(cache.get(1)).to eq(1)

      cache.put(3, 3)
      expect(cache.get(2)).to eq(-1)

      cache.put(4, 4)
      expect(cache.get(1)).to eq(-1)
      expect(cache.get(3)).to eq(3)
      expect(cache.get(4)).to eq(4)
    end
  end
end
