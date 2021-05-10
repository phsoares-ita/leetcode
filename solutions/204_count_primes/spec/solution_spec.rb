require 'spec_helper'
require 'byebug'

# @param {Integer} n
# @return {Integer}
def count_primes(n)
  return 0 if n <= 2

  max_number_to_try = Math.sqrt(n).floor
  primes = [0, 0] + Array.new(n - 2, 1)
  (2..max_number_to_try).each do |candidate|
    next unless primes[candidate] == 1

    (2..(n / candidate)).each do |x|
      primes[x * candidate] = 0
    end
  end
  primes.sum
end

describe 'solution' do
  it { expect(count_primes(0)).to eq 0 }
  it { expect(count_primes(1)).to eq 0 }
  it { expect(count_primes(2)).to eq 0 }
  it { expect(count_primes(3)).to eq 1 }
  it { expect(count_primes(4)).to eq 2 }
  it { expect(count_primes(5)).to eq 2 }
  it { expect(count_primes(6)).to eq 3 }
  it { expect(count_primes(7)).to eq 3 }
  it { expect(count_primes(8)).to eq 4 }
  it { expect(count_primes(9)).to eq 4 }
  it { expect(count_primes(10)).to eq 4 }
  it { expect(count_primes(5e6)).to eq 4 }
end
