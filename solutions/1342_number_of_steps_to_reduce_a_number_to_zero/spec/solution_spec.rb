require 'spec_helper'
require 'byebug'

# @param {Integer} num
# @return {Integer}
def number_of_steps(num)
  return 0 if num == 0

  (num.even?) ? 1 + number_of_steps(num / 2) : 1 + number_of_steps(num - 1)
end
describe 'solution' do
  it { expect(number_of_steps(1)).to eq 1 }
  it { expect(number_of_steps(2)).to eq 2 }
  it { expect(number_of_steps(3)).to eq 3 }
  it { expect(number_of_steps(4)).to eq 3 }
end
