require 'spec_helper'
require 'byebug'

# @param {String[]} a
# @return {String[]}
def common_chars(s)
  return s.first.chars if s.length == 1

  ret = []
  s = s.map { |str| str.split('') }
  first_arr = s.shift
  first_arr.each do |char|
    next unless s.all? { |other_arr| other_arr.include?(char) }

    s.each do |other_arr|
      idx = other_arr.find_index(char)
      other_arr[idx] = '.'
    end
    ret << char
  end
  ret
end

describe 'solution' do
  let(:big_str) { 'a' * 100 }
  it { expect(common_chars(%w[bella])).to eq %w[b e l l a] }
  it { expect(common_chars(%w[bella label roller])).to eq %w[e l l] }
  it { expect(common_chars(%w[bella label roler])).to eq %w[e l] }
  it { expect(common_chars([big_str] * 100)).to eq big_str.split('') }
end
