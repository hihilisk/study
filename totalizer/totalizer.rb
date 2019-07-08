def totalizer(number)
  random_number = rand(10)
  if random_number == number
    return 'Winner!'
  else
    return 'You lost!'
  end
end

p totalizer(rand(10))