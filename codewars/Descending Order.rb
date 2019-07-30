def descending_order(n)
  n.to_s.chars.sort.reverse.join.to_i
end

# Your task is to make a function that can take any non-negative integer as a argument and return it with its digits in descending order. Essentially, rearrange the digits to create the highest possible number.
#
#     Examples:
#     Input: 21445 Output: 54421
