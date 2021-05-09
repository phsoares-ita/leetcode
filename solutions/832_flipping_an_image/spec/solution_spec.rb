require 'spec_helper'
require 'byebug'

# @param {Integer[][]} image
# @return {Integer[][]}
def flip_and_invert_image(image)
  reverse(invert(image))
end

def reverse(image)
  image.map(&:reverse)
end

def invert(image)
  image.map { |row| row.map { |e| 1 - e } }
end

describe 'solution' do
  it { expect(flip_and_invert_image([[1]])).to eq [[0]] }
  it { expect(flip_and_invert_image([[1,0,0], [0,1,1]])).to eq [[1,1,0], [0,0,1]] }
end
