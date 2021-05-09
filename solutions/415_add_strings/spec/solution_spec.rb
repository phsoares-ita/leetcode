require 'spec_helper'
require 'byebug'

# @param {String} num1
# @param {String} num2
# @return {String}
def add_strings(num1, num2)
  digits1 = num1.chars
  digits2 = num2.chars

  ret = []
  carry = 0
  until (digits1 + digits2).empty? && carry.zero?
    sum = sum_last_digits(digits1, digits2, carry)
    ret = [(sum % 10).to_s] + ret
    carry = sum / 10
  end
  ret.join
end

def sum_last_digits(digits1, digits2, carry)
  a = (digits1.pop || '0').to_i
  b = (digits2.pop || '0').to_i
  a + b + carry
end

describe 'solution' do
  it { expect(add_strings('12', '7')).to eq '19' }
  it { expect(add_strings('12', '9')).to eq '21' }
  it { expect(add_strings('92', '9')).to eq '101' }
end
