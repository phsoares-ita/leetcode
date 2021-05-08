require 'spec_helper'
require 'byebug'

# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
  occurrences = map_occurrences(magazine)
  ransom_note.chars.each do |char|
    next if char =~ /\s/
    return false if occurrences[char].zero?

    occurrences[char] -= 1
  end
  true
end

def map_occurrences(text)
  ret = {}
  text.chars.each do |char|
    ret[char] ||= 0
    ret[char] += 1
  end
  ret
end

describe 'solution' do
  it { expect(can_construct('i love you', 'iloveyou')).to eq true }
  it { expect(can_construct('i love you', 'iloveya')).to eq false }
end
