require 'spec_helper'
require 'byebug'

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  return 0 if prices.length < 2

  ret = 0
  index = 0
  while index < prices.length - 1
    next_pos = index + 1
    next_pos += 1 while next_pos < prices.length && prices[next_pos] >= prices[next_pos - 1]
    ret += prices[next_pos - 1] - prices[index]
    index = next_pos
  end
  ret
end

describe 'solution' do
  it { expect(max_profit([1])).to eq 0 }

  it { expect(max_profit([1, 9])).to eq 8 }
  it { expect(max_profit([10, 9])).to eq 0 }
  it { expect(max_profit([10, 10])).to eq 0 }

  it { expect(max_profit([1, 2, 3])).to eq 2 }
  it { expect(max_profit([1, 3, 2])).to eq 2 }
  it { expect(max_profit([3, 1, 2])).to eq 1 }
  it { expect(max_profit([2, 1, 3])).to eq 2 }
  it { expect(max_profit([2, 3, 1])).to eq 1 }
  it { expect(max_profit([3, 2, 1])).to eq 0 }

  it { expect(max_profit([7, 1, 5, 3, 6, 4])).to eq 7 }
end
