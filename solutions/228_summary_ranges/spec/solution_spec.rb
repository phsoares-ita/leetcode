require 'spec_helper'
require 'byebug'

# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
  ret = group_continuous_elements(nums)
  ret.map { |arr| build_interval(arr) }
end

def group_continuous_elements(nums)
  ret = []
  nums.each do |num|
    if !ret.empty? && ret.last.last + 1 == num
      ret.last << num
    else
      ret << [num]
    end
  end
  ret
end

def build_interval(arr)
  return build_single_element_interval(arr) if arr.length == 1

  build_multiple_elements_interval(arr)
end

def build_single_element_interval(arr)
  arr.first.to_s
end

def build_multiple_elements_interval(arr)
  "#{arr.first}->#{arr.last}"
end

describe 'solution' do
  it { expect(summary_ranges([])).to eq [] }
  it { expect(summary_ranges([5])).to eq ['5'] }
  it { expect(summary_ranges([1, 2, 3, 5])).to eq ['1->3', '5'] }
end
