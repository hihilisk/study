def totalizer(num)
  random_num = rand(10)
  if random_num == num
    return    p 'You win!'
  else
    p "You lose! victory number: #{random_num}, your number: #{num}"
  end
end

totalizator(4)
