require 'spec_helper'
require 'byebug'

# @param {String} s
# @return {Boolean}
def is_valid(s)
  return true if s.empty?

  while true
    reduced, s = reduce_expression(s, /\(\)/)
    next if reduced

    reduced, s = reduce_expression(s, /\{\}/)
    next if reduced

    reduced, s = reduce_expression(s, /\[\]/)
    next if reduced

    break
  end

  s.empty?
end

def reduce_expression(s, regex)
  s1 = s.gsub(regex, '')
  return [true, s1] if s1.length < s.length

  [false, s]
end

describe 'solution' do
  it { expect(is_valid('(')).to eq false }
  it { expect(is_valid('()')).to eq true }
end
