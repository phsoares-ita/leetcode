require 'spec_helper'
require 'byebug'
require 'date'

# @param {Integer} day
# @param {Integer} month
# @param {Integer} year
# @return {String}
def day_of_the_week(day, month, year)
  base_date = Date.new(2021, 5, 7)
  base_week_day = 5
  new_date = Date.new(year, month, day)
  diff = (new_date - base_date).to_i
  day_from_index((base_week_day + diff) % 7)
end

def day_from_index(idx)
  arr = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
  arr[idx]
end

describe 'solution' do
  it { expect(day_of_the_week(7, 5, 2021)).to eq 'Friday' }
  it { expect(day_of_the_week(13, 5, 2021)).to eq 'Thursday' }
  it { expect(day_of_the_week(14, 5, 2021)).to eq 'Friday' }
  it { expect(day_of_the_week(30, 4, 2021)).to eq 'Friday' }
  it { expect(day_of_the_week(8, 5, 2021)).to eq 'Saturday' }
end
