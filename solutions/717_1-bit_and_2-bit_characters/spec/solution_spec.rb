require 'spec_helper'
require 'byebug'

# @param {Integer[]} bits
# @return {Boolean}
def is_one_bit_character(bits)
    bits.pop
    until bits.empty?
      next if bits.shift == 0
      return false unless bits.shift
    end
    true
end

describe 'solution' do
  it { expect(is_one_bit_character([0])).to eq true }

  it { expect(is_one_bit_character([1, 0])).to eq false }
  it { expect(is_one_bit_character([0, 0])).to eq true }

  it { expect(is_one_bit_character([1, 1, 0])).to eq true }
  it { expect(is_one_bit_character([1, 0, 0])).to eq true }
  it { expect(is_one_bit_character([0, 1, 0])).to eq false }
  it { expect(is_one_bit_character([0, 0, 0])).to eq true }


  it { expect(is_one_bit_character([0, 1, 1, 0])).to eq true }
  it { expect(is_one_bit_character([0, 1, 0, 0])).to eq true }
  it { expect(is_one_bit_character([0, 0, 1, 0])).to eq false }
  it { expect(is_one_bit_character([0, 0, 0, 0])).to eq true }
  it { expect(is_one_bit_character([1, 1, 1, 0])).to eq false }
  it { expect(is_one_bit_character([1, 1, 0, 0])).to eq true }
  it { expect(is_one_bit_character([1, 0, 1, 0])).to eq false }
  it { expect(is_one_bit_character([1, 0, 0, 0])).to eq true }
end
