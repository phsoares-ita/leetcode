require 'spec_helper'
require 'byebug'

class ListNode
    attr_accessor :val, :next

    def initialize(val, _next = nil)
        
    end
end

def add_two_numbers(l1, l2)

end

describe 'solution' do
    before do
        @l1 = ListNode.new(1)
        @l2 = ListNode.new(9)
    end

    it { expect(add_two_numbers(@l1, @l2).val).to eq 0}
    it { expect(add_two_numbers(@l1, @l2).next.val).to eq 1}
end