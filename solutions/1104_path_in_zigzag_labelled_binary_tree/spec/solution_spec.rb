require 'spec_helper'
require 'byebug'

# @param {Integer} label
# @return {Integer[]}
def path_in_zig_zag_tree(label)
  return [1] if label == 1

  ret = [label]
  index_tree = build_index_tree(label)

  last_row_index = index_tree.length - 1

  while last_row_index > 0
    parent_index = index_tree[last_row_index].find_index(label) / 2
    last_row_index -= 1
    label = index_tree[last_row_index][parent_index]
    ret.insert(0, label)
  end
  ret
end

def build_index_tree(label)
  ret = [[1]]
  row_number = 2
  last_max = 1
  while last_max < label
    row = ((1 + last_max)..(2 * ret.last.length + last_max)).to_a
    last_max = row.last
    ret << (row_number.odd? ? row : row.reverse)
    row_number += 1
  end
  ret
end

describe 'solution' do
  it { expect(path_in_zig_zag_tree(1)).to eq [1] }
  it { expect(path_in_zig_zag_tree(2)).to eq [1, 2] }
  it { expect(path_in_zig_zag_tree(4)).to eq [1, 3, 4] }
  it { expect(path_in_zig_zag_tree(14)).to eq [1, 3, 4, 14] }
end
