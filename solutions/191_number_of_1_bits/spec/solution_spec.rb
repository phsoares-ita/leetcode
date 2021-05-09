require 'spec_helper'
require 'byebug'

# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
  ret = 0
  while n.positive?
    remainder = n % 2
    ret += 1 if remainder == 1
    n /= 2
  end
  ret
end

describe 'solution' do
  it { expect(hamming_weight(0)).to eq 0 }
  it { expect(hamming_weight(1)).to eq 1 }
  it { expect(hamming_weight(2)).to eq 1 }
  it { expect(hamming_weight(3)).to eq 2 }
  it { expect(hamming_weight(4)).to eq 1 }
  it { expect(hamming_weight(5)).to eq 2 }
  it { expect(hamming_weight(6)).to eq 2 }
  it { expect(hamming_weight(7)).to eq 3 }
end
