require 'spec_helper'
require 'byebug'

# @param {String} s
# @return {String}
def reformat(s)
  digits = s.chars.select { |x| x =~ /[0-9]/ }
  chars = s.chars.select { |x| x =~ /[a-zA-Z]/ }
  return '' if (digits.length - chars.length).abs > 1

  ret = []
  a, b = digits.length > chars.length ? [digits, chars] : [chars, digits]
  until (a + b).empty?
    ret << a.shift unless a.empty?
    ret << b.shift unless b.empty?
  end
  ret.join
end

describe 'solution' do
  it { expect(reformat('a')).to eq 'a' }
  it { expect(reformat('aa')).to eq '' }
  it { expect(reformat('a1')).to eq 'a1' }
  it { expect(reformat('a12')).to eq '1a2' }
end
