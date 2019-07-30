def divisors(n)
  range = 2..(n / 2)
  acc_array = []
  range.each { |i| n % i == 0 ? acc_array.push(i) : acc_array }
  acc_array.size.zero? ? "#{n} is prime" : acc_array
end

# Create a function named divisors/Divisors that takes an integer n > 1 and returns an array with all of the integer's
# divisors(except for 1 and the number itself), from smallest to largest. If the number is prime return the string '
# (integer) is prime' (null in C#) (use Either String a in Haskell and Result<Vec<u32>, String> in Rust).
#
# Example:
# divisors(12) # should return [2,3,4,6]
