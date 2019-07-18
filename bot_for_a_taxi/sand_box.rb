def request_route
  p 'Где вы находитесь?:'
  @from = gets.chomp
  p 'Куда вам нужно?:'
  @into = gets.chomp
end