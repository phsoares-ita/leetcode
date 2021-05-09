require 'spec_helper'
require 'byebug'

# @param {Integer[]} candy_type
# @return {Integer}
def distribute_candies(candy_type)
  unique_candy_types = candy_type.each_with_index.to_h.keys
  [unique_candy_types.length, candy_type.length / 2].min
end

describe 'solution' do
  it { expect(distribute_candies([1,2])).to eq 1 }
  it { expect(distribute_candies([1,2,3,4])).to eq 2 }
  it { expect(distribute_candies([1,2,2,4])).to eq 2 }
  it { expect(distribute_candies([1,2,2,2])).to eq 2 }
  it { expect(distribute_candies([2,2,2,2])).to eq 1 }
end
