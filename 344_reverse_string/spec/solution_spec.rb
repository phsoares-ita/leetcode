require 'spec_helper'
require 'byebug'

def reverse_string(nums1)
  a = 0
  b = nums1.length - 1
  while a < b
    nums1[a], nums1[b] = nums1[b], nums1[a]
    a += 1
    b -= 1
  end
  nums1
end

describe 'solution' do
  it { expect(reverse_string(['1'])).to eq ['1'] }
  it { expect(reverse_string(['1', '2'])).to eq ['2', '1'] }
  it { expect(reverse_string(['1', '2', '3'])).to eq ['3', '2', '1'] }
end
