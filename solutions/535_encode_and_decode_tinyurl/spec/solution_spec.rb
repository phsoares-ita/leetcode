require 'spec_helper'
require 'byebug'

ENCODED_URLS = {}

# Encodes a URL to a shortened URL.
#
# @param {string} longUrl
# @return {string}
def encode(longUrl)
  current_value = (ENCODED_URLS.keys.map(&:to_i).max || 0) + 1
  ENCODED_URLS[current_value.to_s] = longUrl
  "http://tinyurl.com/#{current_value}"
end

# Decodes a shortened URL to its original URL.
#
# @param {string} shortUrl
# @return {string}
def decode(shortUrl)
  id = shortUrl.gsub('http://tinyurl.com/', '')
  id = id.gsub(%r{/*\Z}, '')
  ENCODED_URLS[id]
end

# Your functions will be called as such:
# decode(encode(url))

describe 'solution' do
  let(:url) { 'https://leetcode.com/problems/design-tinyurl' }
  let(:encoded_url) { encode(url) }
  it { expect(decode(encoded_url)).to eq 'https://leetcode.com/problems/design-tinyurl' }
  it { expect(decode(encoded_url + '/')).to eq 'https://leetcode.com/problems/design-tinyurl' }
end
