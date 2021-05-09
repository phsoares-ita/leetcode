require 'spec_helper'
require 'byebug'

# @param {Integer} num_bottles
# @param {Integer} num_exchange
# @return {Integer}
def num_water_bottles(num_bottles, num_exchange)
  # first round
  ret = num_bottles
  empty_bottles = num_bottles

  while empty_bottles >= num_exchange
    full_bottles = empty_bottles / num_exchange
    empty_bottles = full_bottles + (empty_bottles % num_exchange)
    ret += full_bottles
  end

  ret
end

describe 'solution' do
  it { expect(num_water_bottles(1, 3)).to eq 1 }
  it { expect(num_water_bottles(2, 3)).to eq 2 }
  it { expect(num_water_bottles(3, 3)).to eq 4 }
  it { expect(num_water_bottles(4, 3)).to eq 5 }
  it { expect(num_water_bottles(5, 3)).to eq 7 }
  it { expect(num_water_bottles(9, 3)).to eq 13 }
end
