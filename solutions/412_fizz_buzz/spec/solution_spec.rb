require "spec_helper"
require "byebug"

# answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
# answer[i] == "Fizz" if i is divisible by 3.
# answer[i] == "Buzz" if i is divisible by 5.
# answer[i] == i if non of the above conditions are true.

# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  (1..n).map { |x| builder(x) }
end

def builder(n)
  if n % 5 == 0 && n % 3 == 0
    "FizzBuzz"
  elsif n % 5 == 0
    "Buzz"
  elsif n % 3 == 0
    "Fizz"
  else
    n.to_s
  end
end

describe "solution" do
  let(:ans) { ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz"] }
  it { expect(fizz_buzz(15)).to eq(ans) }
end
