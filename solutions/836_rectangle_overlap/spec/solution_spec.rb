require 'spec_helper'
require 'byebug'

# @param {Integer[]} rec1
# @param {Integer[]} rec2
# @return {Boolean}
def is_rectangle_overlap(rec1, rec2)
  return false if area(rec1) == 0
  return false if area(rec2) == 0

  return false if is_top(rec1, rec2) || is_left(rec1, rec2) || is_right(rec1, rec2) || is_bottom(rec1, rec2)

  true
end

def is_top(rec1, rec2)
  x1, y1, x2, y2 = rec1
  a1, b1, a2, b2 = rec2
  y1 >= b2
end

def is_bottom(rec1, rec2)
  x1, y1, x2, y2 = rec1
  a1, b1, a2, b2 = rec2
  y2 <= b1
end

def is_left(rec1, rec2)
  x1, y1, x2, y2 = rec1
  a1, b1, a2, b2 = rec2
  x2 <= a1
end

def is_right(rec1, rec2)
  x1, y1, x2, y2 = rec1
  a1, b1, a2, b2 = rec2
  x1 >= a2
end

def area(rec)
  x1, y1, x2, y2 = rec
  (x2 - x1) * (y2 - y1)
end

describe 'solution' do
  it { expect(is_rectangle_overlap([0, 0, 2, 2], [1, 1, 3, 3])).to eq true }
  it { expect(is_rectangle_overlap([0, 0, 2, 2], [2, 2, 3, 3])).to eq false }
  it { expect(is_rectangle_overlap([0, 0, 2, 2], [-1, 0, 3, 3])).to eq true }
end
