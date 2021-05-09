require 'spec_helper'
require 'byebug'

class AlienWord
  def initialize(word, order)
    @word = word
    @order = order.chars
  end

  def <=>(other)
    translate <=> other.translate
  end

  def to_s
    @word
  end

  def translate
    @word.chars.map do |e|
      idx = @order.find_index(e)
      ('a'..'z').to_a[idx]
    end.join
  end
end

# @param {String[]} words
# @param {String} order
# @return {Boolean}
def is_alien_sorted(words, order)
  words.sort { |a, b| AlienWord.new(a, order) <=> AlienWord.new(b, order) }.map(&:to_s) == words
end

describe 'solution' do
  let(:words) { %w[hello leetcode] }
  let(:order) { 'hlabcdefgijkmnopqrstuvwxyz' }

  it { expect(is_alien_sorted(words, order)).to eq true }
end
