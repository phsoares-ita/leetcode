require 'spec_helper'
require 'byebug'

# @param {String} paragraph
# @param {String[]} banned
# @return {String}
def most_common_word(paragraph, banned)
  occurrences = map_occurrences(paragraph, banned)
  higher_count = occurrences.values.max
  occurrences.select { |_, v| v == higher_count }.keys.first
end

def map_occurrences(text, banned)
  text = text.downcase
  tokens = text.split(/\W/)
  ret = {}
  tokens.each do |token|
    next if banned.include?(token)
    next if token =~ /\A\s*\Z/

    ret[token] ||= 0
    ret[token] += 1
  end
  ret
end

describe 'solution' do
  it 'returns most common words' do
    paragraph = 'Bob hit a ball, the hit BALL flew far after it was hit.'
    banned = ['hit']
    expect(most_common_word(paragraph, banned)).to eq 'ball'
  end

  it 'ignores ponctuation' do
    paragraph = 'Bob. hIt, baLl'
    banned = %w[bob hit]
    expect(most_common_word(paragraph, banned)).to eq 'ball'
  end
end
