def result(a, b, c, d)
  # BEGIN (write your solution here)
  if a === c && b === d
    return 2
  elsif  a > b && c > d or a < b && c < d or a === b && c === d
    return 1
  else
    return 0
  end
  # END
end
