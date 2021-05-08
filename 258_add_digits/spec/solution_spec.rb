require 'spec_helper'
require 'byebug'

# @param {Integer} num
# @return {Integer}
def add_digits(num)
  while num >= 10
    last_digit = num % 10
    num /= 10
    num += last_digit
  end
  num
end

describe 'solution' do
  it { expect(add_digits(0)).to eq 0 }
  it { expect(add_digits(9)).to eq 9 }
  it { expect(add_digits(10)).to eq 1 }
  it { expect(add_digits(129)).to eq 3 }
end
