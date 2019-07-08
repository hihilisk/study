def totalizer(number)
  random_number = rand(10)
  if random_number == number
    result = 'Winner!'
    p result
    return result = true
  else
    result = "You lose! victory number: #{random_number}, your number: #{number}"
    p result
    return result = false
  end
end

totalizer(rand(10))