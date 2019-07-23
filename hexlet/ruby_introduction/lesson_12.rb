require 'wrong/assert'
include Wrong::Assert

def sum_of(range)
# BEGIN (write your solution here)
  sum = 0
  range.each do |num|
    sum += yield(num)
  end
  sum
# END
end

result1 = sum_of(1..3) do |num|
  num * 2
end
assert { result1 == 12 }

result2 = sum_of([1, 100, 3]) do |num|
  num + 3
end
assert { result2 == 113 }
