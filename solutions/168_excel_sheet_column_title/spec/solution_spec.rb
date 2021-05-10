require 'spec_helper'
require 'byebug'

# @param {Integer} column_number
# @return {String}
def convert_to_title(x)
  ret = []
  letters = ('A'..'Z').to_a
  while x > 0
    ret << letters[(x-1) % 26]
    x = (x-1) / 26
  end
  ret.reverse.join
end

describe 'solution' do
  it { expect(convert_to_title(1)).to eq 'A' }
  it { expect(convert_to_title(26)).to eq 'Z' }
  it { expect(convert_to_title(27)).to eq 'AA' }
  it { expect(convert_to_title(52)).to eq 'AZ' }
  it { expect(convert_to_title(53)).to eq 'BA' }
end
