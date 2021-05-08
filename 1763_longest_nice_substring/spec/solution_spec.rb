require 'spec_helper'
require 'byebug'

def longest_nice_substring(str)
  ret = []
  (0...str.length).each do |i|
    (i...str.length).each do |j|
      substring = str[i..j]
      ret << substring if nice?(substring)
    end
  end
  ret.max_by(&:length)
end

def nice?(substring)
  chars = substring.chars.each_with_index.to_h
  chars.all? { |c, _| chars[c.downcase] && chars[c.upcase] }
end

describe 'longest_nice_substring' do
  it { expect(longest_nice_substring('YazaAay')).to eq 'aAa' }
end
