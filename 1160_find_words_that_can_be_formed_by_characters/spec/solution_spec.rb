require 'spec_helper'
require 'byebug'

# @param {String[]} words
# @param {String} chars
# @return {Integer}
def count_characters(words, chars)
  words.select { |word| can_be_formed_by(word, chars) }.join.length
end

def can_be_formed_by(word, chars)
  chars = chars.chars
  word.each_char do |char|
    return false unless chars.include?(char)

    idx = chars.find_index(char)
    chars[idx] = '.'
  end
  true
end

describe 'solution' do
  it { expect(count_characters(["cat","bt","hat","tree"], 'atach')).to eq 6 }
end
