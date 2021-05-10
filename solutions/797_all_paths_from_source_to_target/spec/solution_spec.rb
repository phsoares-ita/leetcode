require 'spec_helper'
require 'byebug'

# @param {Integer[][]} graph
# @return {Integer[][]}
def all_paths_source_target(graph)
  paths = [[graph.length - 1]]

  while true
    new_paths = []
    changed = false
    paths.each do |path|
      target = path.first
      origins = find_origins_to_target(graph, target)
      if origins.empty?
        new_paths << path
      else
        changed = true
        origins.each do |origin|
          new_paths << [origin] + path
        end
      end
    end
    paths = new_paths
    break unless changed
  end
  paths.select { |path| path.first == 0 && path.last == graph.length - 1 }
end

def find_origins_to_target(graph, target)
  ret = []
  graph.each_with_index do |destinations, index|
    ret << index if destinations.include?(target)
  end
  ret
end

describe 'solution' do
  it { expect(all_paths_source_target([[1], []])).to eq [[0, 1]] }
  it { expect(all_paths_source_target([[2, 1], [2], []])).to eq [[0, 2], [0, 1, 2]] }
end
