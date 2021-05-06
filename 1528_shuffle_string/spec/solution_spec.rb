require 'spec_helper'
require 'byebug'

def restore_string(s, indices)
  ret = Array.new(s.length)
  indices.each_with_index do |new_index, i|
    ret[new_index] = s[i]
  end
  ret.join
end

describe 'solution' do
  it 'should work with given example' do
    s = 'codeleet'
    indices = [4, 5, 6, 7, 0, 2, 1, 3]
    ret = restore_string(s, indices)
    expect(ret).to eq('leetcode')
  end

  it 'should work with one letter' do
    ret = restore_string('s', [0])
    expect(ret).to eq('s')
  end

end
