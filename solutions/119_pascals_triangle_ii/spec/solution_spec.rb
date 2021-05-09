require 'spec_helper'
require 'byebug'

# @param {Integer} row_index
# @return {Integer[]}
def get_row(row_index)
  return [1] if row_index == 0
  return [1, 1] if row_index == 1

  last_row = get_row(row_index - 1)
  ret = (1...row_index).map { |i| last_row[i - 1] + last_row[i] }
  [1] + ret + [1]
end

describe 'solution' do
  it { expect(get_row(0)).to eq [1] }
  it { expect(get_row(1)).to eq [1, 1] }
  it { expect(get_row(2)).to eq [1, 2, 1] }
  it { expect(get_row(33).length).to eq 34 }
end
