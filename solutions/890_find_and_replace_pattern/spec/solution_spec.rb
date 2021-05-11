require 'spec_helper'
require 'byebug'

# @param {String[]} words
# @param {String} pattern
# @return {String[]}
def find_and_replace_pattern(words, pattern)
  words.select do |word|
    pattern?(word, pattern)
  end
end

def pattern?(word, pattern)
  return false if word.length != pattern.length

  map_left_to_right = {}
  map_right_to_left = {}
  (0...word.length).each do |index|
    a = word[index]
    b = pattern[index]
    if !map_left_to_right[a] && !map_right_to_left[b]
      map_left_to_right[a] = b
      map_right_to_left[b] = a
    elsif map_left_to_right[a] != b || map_right_to_left[b] != a
      return false
    end
  end
  true
end

describe 'solution' do
  it 'find patterns' do
    words = %w[abc deq mee aqq dkd ccc]
    pattern = 'abb'
    expect(find_and_replace_pattern(words, pattern)).to eq %w[mee aqq]
  end
end
