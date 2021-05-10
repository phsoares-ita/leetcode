require 'spec_helper'
require 'byebug'

# @param {Integer} column_number
# @return {String}
def convert_to_title(x)
  letters = ('A'..'Z').to_a
  if (x - 1) / 26 == 0
    letters[x - 1]
  elsif (x - 1) / 26 == 1
    'A' + letters[(x - 1) % 26]
  elsif (x - 1) / 26 == 2
    'B' + letters[(x - 1) % 26]
  end
end

describe 'solution' do
  it { expect(convert_to_title(1)).to eq 'A' }
  it { expect(convert_to_title(26)).to eq 'Z' }
  it { expect(convert_to_title(27)).to eq 'AA' }
  it { expect(convert_to_title(52)).to eq 'AZ' }
  it { expect(convert_to_title(53)).to eq 'BA' }
end
