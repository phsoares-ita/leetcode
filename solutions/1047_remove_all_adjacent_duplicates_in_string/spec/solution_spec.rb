require 'spec_helper'
require 'byebug'

# @param {String} s
# @return {String}
def remove_duplicates(str)
  pos = 0
  len = str.length
  while pos < str.length
    pos1, pos2 = duplicated_pos(str, pos)
    unique_chars = pos2 - pos1
    if unique_chars > 1 && unique_chars.even?
      str = str[0...pos1] + str[pos2..]
    elsif unique_chars > 1 && unique_chars.odd?
      str = str[0...pos1] + str[pos2 - 1..]
    end
    pos += 1
  end
  return str if str.length == len

  remove_duplicates(str)
end

def duplicated_pos(str, pos)
  next_pos = pos + 1
  next_pos += 1 while str[pos] == str[next_pos]
  [pos, next_pos]
end

describe 'solution' do
  let(:big_string) { (%w[a] * 2e4).join }
  let(:big_string2) { 'aabb' * 5e3 }
  it { expect(remove_duplicates('s')).to eq 's' }
  it { expect(remove_duplicates('ss')).to eq '' }
  it { expect(remove_duplicates('sa')).to eq 'sa' }
  it { expect(remove_duplicates('ssa')).to eq 'a' }
  it { expect(remove_duplicates('sas')).to eq 'sas' }
  it { expect(remove_duplicates('ass')).to eq 'a' }
  it { expect(remove_duplicates('ssss')).to eq '' }
  it { expect(remove_duplicates('sssa')).to eq 'sa' }
  it { expect(remove_duplicates('ssas')).to eq 'as' }
  it { expect(remove_duplicates('sass')).to eq 'sa' }
  it { expect(remove_duplicates('asss')).to eq 'as' }
  it { expect(remove_duplicates('sssas')).to eq 'sas' }
  it { expect(remove_duplicates(big_string)).to eq '' }
  it { expect(remove_duplicates("a#{big_string}")).to eq 'a' }
  it { expect(remove_duplicates(big_string2)).to eq '' }
end
