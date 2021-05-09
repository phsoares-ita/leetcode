require 'spec_helper'
require 'byebug'

# @param {Integer[][]} intervals
# @return {Boolean}
def can_attend_meetings(intervals)
  intervals.sort_by! { |x, _| x }
  until intervals.length <= 1
    _, end_pos = intervals.shift
    return false if end_pos > intervals.first[0]
  end
  true
end

describe 'solution' do
  context 'disjoint' do
    it { expect(can_attend_meetings([[0, 10], [10, 20]])).to eq true }
    it { expect(can_attend_meetings([[0, 10], [12, 20]])).to eq true }
  end

  context 'intersection smaller than smaller interval' do
    it { expect(can_attend_meetings([[0, 10], [9, 20]])).to eq false }
    it { expect(can_attend_meetings([[20, 30], [9, 25]])).to eq false }
  end

  context 'one interval contains the other' do
    it { expect(can_attend_meetings([[10, 20], [10, 200]])).to eq false }
    it { expect(can_attend_meetings([[10, 20], [8, 200]])).to eq false }
    it { expect(can_attend_meetings([[10, 20], [0, 20]])).to eq false }
    it { expect(can_attend_meetings([[10, 20], [0, 25]])).to eq false }
  end
end
