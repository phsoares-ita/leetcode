require 'spec_helper'
require 'byebug'

class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @map = {}
  end

  # Return the value of the key if the key exists, otherwise return -1.
  def get(key)
    if @map[key]
      refresh_cache(key)
      @map[key]
    else
      -1
    end
  end

  # Update the value of the key if the key exists.
  # Otherwise, add the key-value pair to the cache.
  # If the number of keys exceeds the capacity from this operation, evict the least recently used key.
  def put(key, value)
    key_to_remove = refresh_cache(key)
    @map.delete(key_to_remove) if key_to_remove
    @map[key] = value
  end

  private

  def refresh_cache(key)
    @use_record ||= []
    if @use_record.include?(key)
      key_to_remove = nil
      @use_record.delete(key)
    elsif @use_record.length == @capacity
      key_to_remove = @use_record.shift
    end
    @use_record << key
    key_to_remove
  end
end

describe 'solution' do
  it 'works as map until capacity is reached' do
    cache = LRUCache.new(2)
    expect(cache.get(1)).to eq(-1)
    expect(cache.get(2)).to eq(-1)

    cache.put(1, 10)
    expect(cache.get(1)).to eq(10)
    expect(cache.get(2)).to eq(-1)

    cache.put(2, 11)
    expect(cache.get(1)).to eq(10)
    expect(cache.get(2)).to eq(11)
  end

  it 'drops least recently added key if none is accessed' do
    cache = LRUCache.new(2)
    cache.put(1, 10)
    cache.put(2, 11)
    cache.put(3, 12)

    expect(cache.get(1)).to eq(-1)
    expect(cache.get(2)).to eq(11)
    expect(cache.get(3)).to eq(12)
  end

  it 'drops least recently added key if some key is accessed' do
    cache = LRUCache.new(2)
    cache.put(1, 10)
    cache.put(2, 11)
    cache.get(1)
    cache.get(1)
    cache.get(1)
    cache.get(1)
    cache.get(1)
    cache.put(3, 12)

    expect(cache.get(1)).to eq(10)
    expect(cache.get(2)).to eq(-1)
    expect(cache.get(3)).to eq(12)
  end
end
