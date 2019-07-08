def totalizator(number)
  random_number = rand(10)
  if random_number == number
    'Winner!'
  else
    'You lost!'
  end
end
