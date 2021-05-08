require 'spec_helper'
require 'byebug'

# @param {String} column_title
# @return {Integer}
def title_to_number(column_title)
  letters = ('A'..'Z').to_a
  ordinals = column_title.chars.map { |x| letters.find_index(x) + 1 }
  ordinals.each_with_index.map do |ordinal, index|
    ordinal * (26**(ordinals.length - index - 1))
  end.sum
end

describe 'solution' do
  it { expect(title_to_number('B')).to eq 2 }
  it { expect(title_to_number('Z')).to eq 26 }
  it { expect(title_to_number('AA')).to eq 26 + 1 }
  it { expect(title_to_number('AZ')).to eq 26 + 26 }
  it { expect(title_to_number('BA')).to eq 52 + 1 }
  it { expect(title_to_number('BZ')).to eq 52 + 26 }
  it { expect(title_to_number('CA')).to eq 78 + 1 }
  it { expect(title_to_number('ZA')).to eq 26 * 26 + 1 }
  it { expect(title_to_number('ZZ')).to eq 26 * 26 + 26 }
  it { expect(title_to_number('AAA')).to eq 26 * 26 + 26 + 1 }
end
