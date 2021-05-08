require 'spec_helper'
require 'byebug'

# @param {String} s
# @return {String}
def modify_string(str)
  ret = []
  str.chars.each_with_index.map do |char, index|
    ret << (char == '?' ? char_to_use(ret, str, index) : char)
  end
  ret.join
end

def char_to_use(ret, str, index)
  chars = [ret[index]]
  chars << ret[index - 1] if index >= 1
  chars << str[index + 1] if index + 1 < str.length
  get_another_char(chars)
end

def get_another_char(arr)
  return 'a' unless arr.include?('a')
  return 'b' unless arr.include?('b')
  return 'c' unless arr.include?('c')

  raise StandardError, 'Only 2 elements are alowed in get another char'
end

describe 'solution' do
  it { expect(modify_string('')).to eq '' }
  it { expect(modify_string('?')).to eq 'a' }
  it { expect(modify_string('?z')).to eq 'az' }
  it { expect(modify_string('?a')).to eq 'ba' }
  it { expect(modify_string('b?a')).to eq 'bca' }
  it { expect(modify_string('b??a')).to eq 'baba' }
  it { expect(modify_string('b?')).to eq 'ba' }
end
