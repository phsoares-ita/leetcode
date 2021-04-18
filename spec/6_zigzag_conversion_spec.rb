require 'spec_helper'
require 'byebug'

# @param {String} str
# @param {Integer} num_rows
# @return {String}
def convert(str, num_rows)
  return str if num_rows == 1

  rows = Array.new(num_rows) { [] }
  row = 0
  column = 0
  column_direction = true
  str.each_char do |char|
    rows[row][column] = char
    row, column, column_direction = get_next_position(column_direction, row, column, num_rows)
  end
  rows.map(&:join).join
end

def get_next_position(column_direction, row, column, num_rows)
  if row == 0 || (column_direction && row < num_rows - 1)
    row += 1
    column_direction = true
  else
    row -= 1
    column += 1
    column_direction = false
  end
  [row, column, column_direction]
end

describe 'solution' do
  it { expect(convert('PA', 3)).to eq 'PA' }
  it { expect(convert('PAY', 3)).to eq 'PAY' }
  it { expect(convert('PAYP', 3)).to eq 'PAPY' }
  it { expect(convert('PAYPA', 3)).to eq 'PAAPY' }

  it { expect(convert('PAYPALISHIRING', 1)).to eq 'PAYPALISHIRING' }
  it { expect(convert('PAYPALISHIRING', 3)).to eq 'PAHNAPLSIIGYIR' }
end
