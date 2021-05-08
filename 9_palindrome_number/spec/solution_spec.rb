require 'spec_helper'
require 'byebug'

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  x.to_s == x.to_s.reverse
end

describe 'solution' do
  it { expect(is_palindrome(1)).to eq true }
  it { expect(is_palindrome(12)).to eq false }
  it { expect(is_palindrome(123)).to eq false }
  it { expect(is_palindrome(121)).to eq true }
  it { expect(is_palindrome(-121)).to eq false }
end
