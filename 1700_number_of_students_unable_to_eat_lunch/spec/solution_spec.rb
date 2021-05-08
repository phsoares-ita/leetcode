require 'spec_helper'
require 'byebug'

# @param {Integer[]} students
# @param {Integer[]} sandwiches
# @return {Integer}
def count_students(students, sandwiches)
  (0...students.length).each do |i|
    first_student_preference = students.shift
    if first_student_preference == sandwiches.first
      sandwiches.shift
      return count_students(students, sandwiches)
    else
      students << first_student_preference
    end
  end
  students.length
end

describe 'solution' do
  it { expect(count_students([1], [0])).to eq 1 }
  it { expect(count_students([1], [1])).to eq 0 }
  it { expect(count_students([0,1], [0,1])).to eq 0 }
  it { expect(count_students([0,1], [1,0])).to eq 0 }
  it { expect(count_students([0,1], [1,1])).to eq 1 }
  it { expect(count_students([0,1], [0,0])).to eq 1 }
  it { expect(count_students([1,1], [0,0])).to eq 2 }
  it { expect(count_students([1,1,0,0], [0,1,0,1])).to eq 0 }
end
