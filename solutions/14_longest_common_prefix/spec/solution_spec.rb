require 'spec_helper'
require 'byebug'

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  pos = 0
  ret = ''
  min_len = strs.map(&:length).min
  while pos < min_len
    break unless strs.map { |str| str[pos] }.uniq.count == 1

    ret += strs.first[pos]
    pos += 1
  end
  ret
end

describe 'solution' do
  let(:strs) { %w[flower flow flight] }
  it { expect(longest_common_prefix(strs)).to eq 'fl' }
end
