require 'spec_helper'
require 'byebug'

class Employee
  attr_accessor :id, :importance, :subordinates

  def initialize(id, importance, subordinates)
    @id = id
    @importance = importance
    @subordinates = subordinates
  end
end

# @param {Employee} employees
# @param {Integer} id
# @return {Integer}
def get_importance(employees, id)
  ret = []
  map = {}
  employees.each { |employee| map[employee.id] = employee }
  dfs(map[id], map, ret)
  ret.sum
end

def dfs(employee, map, importances)
  return unless employee

  importances << employee.importance
  employee.subordinates.each do |subordinate|
    dfs(map[subordinate], map, importances)
  end
end
