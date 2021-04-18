require 'spec_helper'
require 'byebug'

def find_median_sorted_arrays(nums1, nums2)
    new_arr = []
    n1 = nums1.shift
    n2 = nums2.shift
    while n1 || n2
        if n1 && n2
            if n1 < n2 
                new_arr << n1
                n1 = nums1.shift
            else
                new_arr << n2
                n2 = nums2.shift
            end
        elsif n1
            new_arr << n1
            n1 = nums1.shift
        elsif n2
            new_arr << n2
            n2 = nums2.shift
        end
    end

    if new_arr.length % 2 == 1
        return new_arr[new_arr.length / 2]
    else
        return (new_arr[new_arr.length / 2 - 1] + new_arr[new_arr.length / 2]) / 2.0
    end
end

describe 'solution' do
  it { expect(find_median_sorted_arrays([1], [2])).to eq 1.5 }
  it { expect(find_median_sorted_arrays([1, 2], [20])).to eq 2 }
  it { expect(find_median_sorted_arrays([1, 20], [2])).to eq 2 }
  it { expect(find_median_sorted_arrays([1, 20, 100], [2])).to eq 11 }
  it { expect(find_median_sorted_arrays([1], [2,3,4,5,6,7])).to eq 4 }
  it { expect(find_median_sorted_arrays([1], [2,3,4,5,6,7,8])).to eq 4.5 }
end