require 'spec_helper'
require 'byebug'

# @param {Integer} n
# @return {String}
def generate_the_string(n)
  return "#{generate_the_string(n - 1)}b" if n.even?

  (['a'] * n).join
end

describe 'solution' do
  it { expect(generate_the_string(1)).to eq 'a' }
  it { expect(generate_the_string(2)).to eq 'ab' }
  it { expect(generate_the_string(3)).to eq 'aaa' }
  it { expect(generate_the_string(4)).to eq 'aaab' }
end
