require 'spec_helper'
require 'byebug'

# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  s.downcase!
  s.gsub!(/[^a-z0-9]*/, '')
  s == s.reverse
end

describe 'solution' do
  let(:text) { 'A man, a plan, a canal: Panama' }
  it { expect(is_palindrome('')).to eq true }
  it { expect(is_palindrome('x')).to eq true }
  it { expect(is_palindrome(text)).to eq true }
  it { expect(is_palindrome("#{text}x")).to eq false }
  it { expect(is_palindrome('ab_a')).to eq true }
end
