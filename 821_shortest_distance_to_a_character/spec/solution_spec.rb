require 'spec_helper'
require 'byebug'

# @param {String} s
# @param {Character} c
# @return {Integer[]}
def shortest_to_char(str, c)
  ret = []
  indices = str.chars.each_with_index.select { |char, _| char == c }.map(&:last)
  before_pos = nil
  after_pos = indices.shift
  ret = []
  (0...str.length).each_with_index do |_, i|
    if after_pos && i > after_pos
      before_pos = after_pos
      after_pos = indices.shift
    end
    if before_pos && after_pos
      ret << [i - before_pos, after_pos - i].min
    elsif after_pos
      ret << [after_pos - i].min
    elsif before_pos
      ret << [i - before_pos].min
    end
  end
  ret
end

describe 'solution' do
  let(:big_string) { 'ab' * 5e3 }
  let(:big_string_response) { [0,1] * 5e3 }
  it { expect(shortest_to_char('a', 'a')).to eq [0] }
  it { expect(shortest_to_char('ab', 'a')).to eq [0, 1] }
  it { expect(shortest_to_char('ab', 'b')).to eq [1, 0] }
  it { expect(shortest_to_char('aab', 'b')).to eq [2, 1, 0] }
  it { expect(shortest_to_char('loveleetcode', 'e')).to eq [3, 2, 1, 0, 1, 0, 0, 1, 2, 2, 1, 0] }
  it { expect(shortest_to_char(big_string, 'a')).to eq big_string_response }
end
