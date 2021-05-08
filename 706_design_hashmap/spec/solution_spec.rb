require "spec_helper"
require "byebug"

class MyHashMap
  BUCKETS = 1000
  # =begin
  #     Initialize your data structure here.
  # =end
  def initialize
    @buckets = Array.new(BUCKETS) { [] }
  end

  # =begin
  #     value will always be non-negative.
  #     :type key: Integer
  #     :type value: Integer
  #     :rtype: Void
  # =end
  def put(key, value)
    idx, bucket = find_bucket_and_index(key)
    if idx
      bucket[idx] = [key, value]
    else
      bucket << [key, value]
    end
  end

  # =begin
  #     Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key
  #     :type key: Integer
  #     :rtype: Integer
  # =end
  def get(key)
    idx, bucket = find_bucket_and_index(key)
    idx ? bucket[idx].last : -1
  end

  # =begin
  #     Removes the mapping of the specified value key if this map contains a mapping for the key
  #     :type key: Integer
  #     :rtype: Void
  # =end
  def remove(key)
    idx, bucket = find_bucket_and_index(key)
    return unless idx

    bucket.delete_at(idx)
  end

  private

  def find_bucket_and_index(key)
    bucket_index = key % BUCKETS
    bucket = @buckets[bucket_index]
    idx = bucket.find_index { |k, _| k == key }
    [idx, bucket]
  end
end

describe "solution" do
  let(:obj) { MyHashMap.new() }
  it "works as a hash map (lol)" do
    expect(obj.get(1)).to eq(-1)

    obj.put(1, 10)
    expect(obj.get(1)).to eq(10)

    obj.remove(1)
    expect(obj.get(1)).to eq(-1)
  end
end
