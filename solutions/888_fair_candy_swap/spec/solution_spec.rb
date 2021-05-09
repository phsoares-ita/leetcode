require 'spec_helper'
require 'byebug'

# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer[]}
def fair_candy_swap(a, b)
  sum_a = a.sum
  sum_b = b.sum
  a_elements = a.each_with_index.to_h
  b_elements = b.each_with_index.to_h
  a_elements.each do |a_element, _|
    b_element = (sum_b - sum_a) / 2 + a_element
    next unless b_elements[b_element]

    return [a_element, b_element]
  end
end

describe 'solution' do
  it { expect(fair_candy_swap([2, 4], [6, 8])).to eq [2, 6] }
end
