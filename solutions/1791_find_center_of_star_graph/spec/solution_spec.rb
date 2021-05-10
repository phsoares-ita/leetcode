require 'spec_helper'
require 'byebug'

# @param {Integer[][]} edges
# @return {Integer}
def find_center(edges)
  map_connections_map = {}
  edges.each do |node1, node2|
    map_connections_map[node1] ||= 0
    map_connections_map[node2] ||= 0
    map_connections_map[node1] += 1
    map_connections_map[node2] += 1
  end
  max_connections_count = map_connections_map.values.max
  map_connections_map.select { |_, v| v == max_connections_count }.keys.first
end

describe 'solution' do
  it { expect(find_center([[2, 1], [3, 1], [1, 4]])).to eq 1 }
end
