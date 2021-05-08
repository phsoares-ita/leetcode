require 'spec_helper'
require 'byebug'

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  ret = 0
  return ret if prices.length < 2

  last_price = prices.shift
  prices.each_with_index do |price, _index|
    if price < last_price
      last_price = price
    else
      ret = [ret, price - last_price].max
    end
  end
  ret
end

describe 'solution' do
  it { expect(max_profit([7])).to eq 0 }
  it { expect(max_profit([7, 1])).to eq 0 }
  it { expect(max_profit([1, 7])).to eq 6 }
  it { expect(max_profit([1, 12, 7])).to eq 11 }
  it { expect(max_profit([12, 1, 7])).to eq 6 }
  it { expect(max_profit([12, 7, 1])).to eq 0 }
  it { expect(max_profit([7, 1, 6, 2, 9])).to eq 8 }
  it { expect(max_profit([7, 8, 9, 2, 11, 3, 12])).to eq 10 }
end
