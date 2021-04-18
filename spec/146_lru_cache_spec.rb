require 'spec_helper'
require 'byebug'

class UniqueQueue
  def initialize(capacity)
    @capacity = capacity
    @queue = []
    @keys = {}
  end

  def add(key)
    key_to_remove = nil
    if present?(key)
      remove(key)
    elsif is_full?
      key_to_remove = @queue.first
      remove_first_key
    end
    @queue << key
    @keys[key] = true
    key_to_remove
  end

  private

  def present?(key)
    @keys[key]
  end

  def is_full?
    @queue.length == @capacity
  end

  def remove_first_key
    first_key = @queue.shift
    @keys.delete(first_key)
  end

  def remove(key)
    @queue.delete(key)
    @keys.delete(key)
  end
end

describe UniqueQueue do
  context 'below capacity queue' do
    it 'should indicate keys to remove' do
      @queue = UniqueQueue.new(2)

      expect(@queue.add(1)).to eq(nil)
      expect(@queue.add(2)).to eq(nil)
      expect(@queue.add(3)).to eq(1)
      expect(@queue.add(3)).to eq(nil)
      expect(@queue.add(4)).to eq(2)
      expect(@queue.add(3)).to eq(nil)
      expect(@queue.add(4)).to eq(nil)
    end
  end
end

class LRUCache
  def initialize(capacity)
    @queue = UniqueQueue.new(capacity)
    @items = {}
  end

  # Return the value of the key if the key exists, otherwise return -1.
  def get(key)
    return -1 unless @items[key]

    @queue.add(key)
    @items[key]
  end

  # Update the value of the key if the key exists.
  # Otherwise, add the key-value pair to the cache.
  # If the number of keys exceeds the capacity from this operation, evict the least recently used key.
  def put(key, value)
    key_to_remove = @queue.add(key)
    @items.delete(key_to_remove) if key_to_remove
    @items[key] = value
  end
end

describe 'solution' do
  context 'empty cache' do
    before do
      @cache = LRUCache.new(3)
    end

    it { expect(@cache.get(0)).to eq -1 }
  end

  context 'below capacity cache' do
    before do
      @cache = LRUCache.new(3)
      @cache.put(0, 10)
    end

    it { expect(@cache.get(0)).to eq(10) }
    it { expect(@cache.get(1)).to eq(-1) }
  end

  context 'equal capacity cache' do
    before do
      @cache = LRUCache.new(3)
      @cache.put(0, 10)
      @cache.put(1, 11)
      @cache.put(2, 12)
    end

    it { expect(@cache.get(0)).to eq(10) }
    it { expect(@cache.get(1)).to eq(11) }
    it { expect(@cache.get(2)).to eq(12) }
    it { expect(@cache.get(3)).to eq(-1) }
  end

  context 'multiple gets' do
    before do
      @cache = LRUCache.new(3)
      @cache.put(0, 10)
      @cache.put(1, 11)
      @cache.put(2, 12)

      @cache.get(1)
      @cache.get(1)
      @cache.get(1)
      @cache.get(1)
      @cache.get(1)

      @cache.put(3, 13)
    end

    it { expect(@cache.get(0)).to eq(-1) }
    it { expect(@cache.get(2)).to eq(12) }
  end

  context 'exceding capacity cache' do
    before do
      @cache = LRUCache.new(3)
      @cache.put(0, 10)
      @cache.put(1, 11)
      @cache.put(2, 12)
      @cache.put(3, 13)
    end

    it { expect(@cache.get(0)).to eq(-1) }
    it { expect(@cache.get(1)).to eq(11) }
    it { expect(@cache.get(2)).to eq(12) }
    it { expect(@cache.get(3)).to eq(13) }

    context 'getting old key should refresh cache usage' do
      it 'getting 1 should make it not expire' do
        byebug
        @cache.get(1)
        @cache.put(4, 14)
        expect(@cache.get(1)).to eq(11)
        expect(@cache.get(2)).to eq(-1)
      end
    end

    context 'problem example' do
      before do
        @cache = LRUCache.new(2)
      end

      it 'works as intended' do
        @cache.put(1, 1)
        @cache.put(2, 2)
        expect(@cache.get(1)).to eq(1)

        @cache.put(3, 3)
        expect(@cache.get(2)).to eq(-1)

        @cache.put(4, 4)
        expect(@cache.get(1)).to eq(-1)
        expect(@cache.get(3)).to eq(3)
        expect(@cache.get(4)).to eq(4)
      end
    end
  end
end
