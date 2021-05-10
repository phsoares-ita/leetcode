require 'spec_helper'
require 'byebug'

# @param {String} pattern
# @param {String} s
# @return {Boolean}
def word_pattern(pattern, s)
  words = s.split(/\s+/)
  letters = pattern.chars
  return false if words.length != letters.length

  map_letter_to_word = {}
  map_word_to_letter = {}
  letters.each_with_index do |letter, index|
    word = words[index]
    if !map_letter_to_word[letter] && !map_word_to_letter[word]
      map_letter_to_word[letter] = word
      map_word_to_letter[word] = letter
    elsif map_letter_to_word[letter] != word || map_word_to_letter[word] != letter
      return false
    end
  end
  true
end

describe 'solution' do
  it 'identifies patterns' do
    pattern = 'abba'
    s = 'dog cat cat dog'
    expect(word_pattern(pattern, s)).to eq true
  end

  it 'identifies when pattern doesnt occours' do
    pattern = 'abba'
    s = 'dog cat cat xepa'
    expect(word_pattern(pattern, s)).to eq false
  end
end
