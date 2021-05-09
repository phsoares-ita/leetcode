require 'spec_helper'
require 'byebug'

# @param {Integer} n
# @return {Integer}
def fib(n)
  return 0 if n == 0
  return 1 if n == 1
  
  ans = Array.new(n)
  ans[0] = 0
  ans[1] = 1
  (2...n).each do |i|
    ans[i] = ans[i-1] + ans[i-2]
  end
  ans[n-1] + ans[n-2]
end

describe 'solution' do
  it { expect(fib(0)).to eq 0 }
  it { expect(fib(1)).to eq 1 }
  it { expect(fib(2)).to eq 1 }
  it { expect(fib(3)).to eq 2 }
  it { expect(fib(4)).to eq 3 }
  it { expect(fib(5)).to eq 5 }
  it { expect(fib(6)).to eq 8 }
end
