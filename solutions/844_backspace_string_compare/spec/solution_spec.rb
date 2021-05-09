require 'spec_helper'
require 'byebug'

# @param {String} s
# @param {String} t
# @return {Boolean}
def backspace_compare(s, t)
  after_backspace(s) == after_backspace(t)
end

def after_backspace(str)
  ret = []
  str.chars.each do |char|
    if char == '#'
      ret.pop
    else
      ret << char
    end
  end
  ret.join
end

describe 'solution' do
  it { expect(after_backspace('a#')).to eq '' }
  it { expect(after_backspace('ba#')).to eq 'b' }
  it { expect(after_backspace('ba#c')).to eq 'bc' }
  it { expect(after_backspace('b#a#c')).to eq 'c' }
  it { expect(after_backspace('ba##c')).to eq 'c' }
end
