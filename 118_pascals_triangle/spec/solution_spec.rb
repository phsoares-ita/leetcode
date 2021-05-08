require 'spec_helper'
require 'byebug'

# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
  map = { 1 => [1] }
  (2..num_rows).each { |index| map[index] = build_row(map[index - 1]) }
  map.select { |k, _| k <= num_rows }.values
end

def build_row(last_row)
  (0..last_row.length).map { |i| value_from_last_row(last_row, i) }
end

def value_from_last_row(last_row, i)
  return 1 if i.zero? || i == last_row.length

  last_row[i - 1] + last_row[i]
end

describe 'solution' do
  it { expect(generate(1)).to eq [[1]] }
  it { expect(generate(2)).to eq [[1], [1, 1]] }
  it { expect(generate(3)).to eq [[1], [1, 1], [1, 2, 1]] }
  it { expect(generate(30).length).to eq 30 }
end
