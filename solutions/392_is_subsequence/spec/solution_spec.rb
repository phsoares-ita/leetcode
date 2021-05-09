require 'spec_helper'
require 'byebug'

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
  pos1 = 0
  pos2 = 0
  while pos1 < s.length && pos2 < t.length
    pos1 += 1 if s[pos1] == t[pos2]
    pos2 += 1
  end
  pos1 == s.length
end

describe 'solution' do
  let(:s1) { 'abc' }
  let(:s2) { 'axc' }
  let(:t) { 'ahbgdc' }
  it { expect(is_subsequence(s1, t)).to eq true }
  it { expect(is_subsequence(s2, t)).to eq false }
end
