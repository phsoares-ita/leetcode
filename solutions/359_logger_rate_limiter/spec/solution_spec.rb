require 'spec_helper'
require 'byebug'

class Logger
  # =begin
  #     Initialize your data structure here.
  # =end
  def initialize()
    @map = {}
  end

  # =begin
  #     Returns true if the message should be printed in the given timestamp, otherwise returns false.
  #         If this method returns false, the message will not be printed.
  #         The timestamp is in seconds granularity.
  #     :type timestamp: Integer
  #     :type message: String
  #     :rtype: Boolean
  # =end
  def should_print_message(timestamp, message)
    @map[message] ||= []
    should_drop_msg = !@map[message].empty? && timestamp - @map[message].last < 10
    return false if should_drop_msg

    @map[message] << timestamp
    true
  end
end
  
describe 'solution' do
  let(:obj) { Logger.new }

  it 'should ignore repeated messages in 10s range' do
    expect(obj.should_print_message(1, 'foo')).to eq true
    expect(obj.should_print_message(1, 'foo')).to eq false
    expect(obj.should_print_message(10, 'foo')).to eq false
    expect(obj.should_print_message(11, 'foo')).to eq true
  end

end
