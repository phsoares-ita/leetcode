require 'spec_helper'
require 'byebug'

# judge trusts no one
# everybody trusts the judge

# @param {Integer} n
# @param {Integer[][]} trust
# @return {Integer}
def find_judge(n, trust)
  if trust.empty?
    return n == 1 ? 1 : -1
  end

  ret = {}
  trust.each do |trustee, trusted|
    ret[trustee] ||= { trusted_by: 0, trusts_in: 0 }
    ret[trustee][:trusts_in] += 1
    ret[trusted] ||= { trusted_by: 0, trusts_in: 0 }
    ret[trusted][:trusted_by] += 1
  end
  ret.select { |_k, v| v[:trusts_in] == 0 && v[:trusted_by] == n - 1 }.keys.first || -1
end

describe 'solution' do
  it { expect(find_judge(1, [])).to eq 1 }
  it { expect(find_judge(2, [[1, 2]])).to eq 2 }
  it { expect(find_judge(2, [[2, 1]])).to eq 1 }
  it { expect(find_judge(2, [[2, 1], [1, 2]])).to eq(-1) }
  it { expect(find_judge(3, [[2, 1], [3, 1], [2, 3]])).to eq(1) }
end
