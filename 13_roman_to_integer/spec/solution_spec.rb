require 'spec_helper'
require 'byebug'

# @param {String} s
# @return {Integer}
def roman_to_int(str)
  chars = str.chars
  ret = 0
  last_value = nil
  until chars.empty?
    last_char = chars.pop
    current_value = value(last_char)
    if last_value && last_value > current_value
      ret -= current_value
    else
      ret += current_value
    end
    last_value = current_value
  end
  ret
end

def value(char)
  dict = { I: 1, V: 5, X: 10, L: 50, C: 100, D: 500, M: 1000 }
  dict[char.to_sym]
end

describe 'solution' do
  it { expect(roman_to_int('I')).to eq 1 }
  it { expect(roman_to_int('II')).to eq 2 }
  it { expect(roman_to_int('III')).to eq 3 }
  it { expect(roman_to_int('IV')).to eq 4 }
  it { expect(roman_to_int('V')).to eq 5 }
  it { expect(roman_to_int('VI')).to eq 6 }
  it { expect(roman_to_int('VII')).to eq 7 }
  it { expect(roman_to_int('VIII')).to eq 8 }
  it { expect(roman_to_int('IX')).to eq 9 }
  it { expect(roman_to_int('X')).to eq 10 }
  it { expect(roman_to_int('XI')).to eq 11 }
  it { expect(roman_to_int('XII')).to eq 12 }
  it { expect(roman_to_int('XIII')).to eq 13 }
  it { expect(roman_to_int('XIV')).to eq 14 }
  it { expect(roman_to_int('XV')).to eq 15 }
  it { expect(roman_to_int('XVI')).to eq 16 }
  it { expect(roman_to_int('XVII')).to eq 17 }
  it { expect(roman_to_int('XVIII')).to eq 18 }
  it { expect(roman_to_int('XIX')).to eq 19 }
  it { expect(roman_to_int('XX')).to eq 20 }
end
