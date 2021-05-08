require 'spec_helper'
require 'byebug'

# @param {Integer} low
# @param {Integer} high
# @return {Integer}
def count_odds(low, high)
  low += 1 if low.even?
  high -= 1 if high.even?
  return 0 if low > high

  ((high - low) / 2 + 1)
end

describe 'solution' do
  it { expect(count_odds(2, 2)).to eq 0 }
  it { expect(count_odds(2, 3)).to eq 1 }
  it { expect(count_odds(3, 3)).to eq 1 }
  it { expect(count_odds(3, 5)).to eq 2 }
  it { expect(count_odds(0, 1e9.to_i)).to eq 5e8.to_i }
end
