require 'spec_helper'
require 'byebug'

# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
  return x if x < 2

  left = 1
  right = x / 2
  while left <= right
    pivot = (left + right) / 2
    val = pivot**2
    return pivot if val == x

    if val < x
      left = pivot + 1
    else
      right = pivot - 1
    end
  end
  left**2 > x ? left - 1 : left
end

describe 'solution' do
  test_cases = [
    { input: 0, output: 0 },
    { input: 1, output: 1 },
    { input: 2, output: 1 },
    { input: 3, output: 1 },
    { input: 4, output: 2 },
    { input: 5, output: 2 },
    { input: 6, output: 2 },
    { input: 7, output: 2 },
    { input: 8, output: 2 },
    { input: 9, output: 3 }
  ]
  test_cases.each do |tt|
    it { expect(my_sqrt(tt[:input])).to eq tt[:output] }
  end
end
