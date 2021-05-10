require 'spec_helper'
require 'byebug'

# @param {Integer} num
# @return {Boolean}
def is_perfect_square(num)
  return true if num.zero?

  left = 1
  right = [1, num / 2].max
  while left <= right
    pivot = (left + right) / 2
    val = pivot**2
    return true if val == num

    if val > num
      right = pivot - 1
    else
      left = pivot + 1
    end
  end
  false
end

describe 'solution' do
  let(:big_num) { 2**31 - 1 } # 2*(1e3)**3
  it { expect(is_perfect_square(0)).to eq true }

  it { expect(is_perfect_square(1)).to eq true }

  it { expect(is_perfect_square(2)).to eq false }
  it { expect(is_perfect_square(3)).to eq false }

  it { expect(is_perfect_square(4)).to eq true }
  it { expect(is_perfect_square(5)).to eq false }
  it { expect(is_perfect_square(6)).to eq false }
  it { expect(is_perfect_square(7)).to eq false }
  it { expect(is_perfect_square(8)).to eq false }

  it { expect(is_perfect_square(9)).to eq true }

  it { expect(is_perfect_square(10)).to eq false }
  it { expect(is_perfect_square(11)).to eq false }
  it { expect(is_perfect_square(12)).to eq false }
  it { expect(is_perfect_square(13)).to eq false }
  it { expect(is_perfect_square(14)).to eq false }
  it { expect(is_perfect_square(15)).to eq false }

  it { expect(is_perfect_square(16)).to eq true }

  it { expect(is_perfect_square(big_num)).to eq false }
end
