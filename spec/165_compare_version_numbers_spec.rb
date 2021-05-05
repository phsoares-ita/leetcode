require 'spec_helper'
require 'byebug'

def compare_version(version1, version2)
  major1, minor1, patch1, subpatch1 = extract_version(version1)
  major2, minor2, patch2, subpatch2 = extract_version(version2)

  major = compare(major1, major2)
  return major if major != 0

  minor = compare(minor1, minor2)
  return minor if minor != 0

  patch = compare(patch1, patch2)
  return patch if patch != 0

  compare(subpatch1, subpatch2)
end

def compare(num1, num2)
  return -1 if num1 < num2
  return 1 if num1 > num2

  0
end

def extract_version(version)
  ret = version.split('.').map(&:to_i)
  ret << 0 while ret.length < 4
  ret
end

describe 'solution' do
  it { expect(compare_version('0.1', '1.2')).to eq(-1) }
  it { expect(compare_version('0.1', '0.2')).to eq(-1) }
  it { expect(compare_version('0.1', '0.1.0')).to eq(0) }
  it { expect(compare_version('0.1', '0.1.1')).to eq(-1) }
  it { expect(compare_version('0001.1', '0.1.0')).to eq(1) }
end
