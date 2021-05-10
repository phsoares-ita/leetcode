require 'spec_helper'
require 'byebug'

# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
   left = 1
   right = n
   cache = {}
   while left <= right
    pivot = (left + right) / 2
    cache[pivot] = is_bad_version(pivot)
    if cache[pivot] 
      right = pivot - 1
    else
      left = pivot + 1
    end
  end
  if cache[left]
    return left - 1
  else
    return left
  end
end