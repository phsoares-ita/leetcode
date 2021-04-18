require 'spec_helper'
require 'byebug'

# @param {String} s
# @return {Integer}
def length_of_longest_substring(str)
  return str.length if str.length < 2

  first_pos = 0
  max_size = 0
  map_of_positions = {}
  str.chars.each_with_index do |char, index|
    if map_of_positions[char] && map_of_positions[char] >= first_pos
      repeated_char_index = map_of_positions[char]
      current_length = index - first_pos
      first_pos = repeated_char_index + 1
      max_size = [current_length, max_size].max
    end
    map_of_positions[char] = index
  end
  [str.length - first_pos, max_size].max
end

describe 'solution' do
  it { expect(length_of_longest_substring('')).to eq 0 }
  it { expect(length_of_longest_substring('1')).to eq 1 }
  it { expect(length_of_longest_substring('11')).to eq 1 }
  it { expect(length_of_longest_substring('12')).to eq 2 }
  it { expect(length_of_longest_substring('121')).to eq 2 }
  it { expect(length_of_longest_substring('122')).to eq 2 }
  it { expect(length_of_longest_substring('123')).to eq 3 }
  it { expect(length_of_longest_substring('1234')).to eq 4 }
  it { expect(length_of_longest_substring('1134')).to eq 3 }
  it { expect(length_of_longest_substring('1214')).to eq 3 }
  it { expect(length_of_longest_substring('1231')).to eq 3 }
  it { expect(length_of_longest_substring('12345')).to eq 5 }
  it { expect(length_of_longest_substring('11345')).to eq 4 }
  it { expect(length_of_longest_substring('12145')).to eq 4 }
  it { expect(length_of_longest_substring('12315')).to eq 4 }
  it { expect(length_of_longest_substring('12341')).to eq 4 }
  it { expect(length_of_longest_substring('21341')).to eq 4 }
  it { expect(length_of_longest_substring('21314')).to eq 3 }
  it { expect(length_of_longest_substring('123427')).to eq 4 }
  it { expect(length_of_longest_substring('123427891')).to eq 7 }
  it { expect(length_of_longest_substring('dvdf')).to eq 3 }
end

# s.length <= 5 * 10**4
