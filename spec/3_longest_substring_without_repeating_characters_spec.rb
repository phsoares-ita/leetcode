require 'spec_helper'
require 'byebug'

# s.length <= 5 * 104
def length_of_longest_substring(str)
  return str.length if str.length < 2

  first_pos = 0
  max_size = 0
  chars_by_index = {}
  str.chars.each_with_index do |char, index|
    if chars_by_index[char]
      max_size = [max_size, index - first_pos].max
      first_pos = chars_by_index[char] + 1
    else
      max_size = [max_size, index - first_pos + 1].max
    end
    chars_by_index[char] = index
  end
  max_size
end

def map_chars_by_index(str)
  ret = {}
  str.chars.each_with_index do |char, index|
    ret[char] ||= []
    ret[char] << index
  end
  ret
end

describe 'solution' do
  it { expect(length_of_longest_substring('')).to eq 0 }

  it { expect(length_of_longest_substring('1')).to eq 1 }

  it { expect(length_of_longest_substring('12')).to eq 2 }
  it { expect(length_of_longest_substring('11')).to eq 1 }

  it { expect(length_of_longest_substring('123')).to eq 3 }
  it { expect(length_of_longest_substring('112')).to eq 2 }
  it { expect(length_of_longest_substring('211')).to eq 2 }
  it { expect(length_of_longest_substring('111')).to eq 1 }

  it { expect(length_of_longest_substring('1234')).to eq 4 }
  it { expect(length_of_longest_substring('1124')).to eq 3 }
  it { expect(length_of_longest_substring('2114')).to eq 2 }
  it { expect(length_of_longest_substring('1114')).to eq 2 }
  it { expect(length_of_longest_substring('1231')).to eq 3 }
  it { expect(length_of_longest_substring('1121')).to eq 2 }
  it { expect(length_of_longest_substring('2111')).to eq 2 }
  it { expect(length_of_longest_substring('1111')).to eq 1 }

  it { expect(length_of_longest_substring('0123456789')).to eq 10 }
  it { expect(length_of_longest_substring('0123456780')).to eq 9 }
  it { expect(length_of_longest_substring('0023456789')).to eq 9 }
  it { expect(length_of_longest_substring('0103456789')).to eq 9 }
  it { expect(length_of_longest_substring('1003456789')).to eq 8 }
  it { expect(length_of_longest_substring('1023456780')).to eq 9 }
end
