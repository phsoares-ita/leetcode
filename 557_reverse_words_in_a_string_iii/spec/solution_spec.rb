require 'spec_helper'
require 'byebug'

# @param {String} s
# @return {String}
def reverse_words(s)
  s.split(/\s+/).map(&:reverse).join(' ')
end

describe 'solution' do
  it { expect(reverse_words('s')).to eq 's' }
  it { expect(reverse_words('saldo')).to eq 'odlas' }
  it { expect(reverse_words('saldo dev')).to eq 'odlas ved' }
end
