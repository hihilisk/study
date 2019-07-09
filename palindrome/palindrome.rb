def palindrome(string)
  if string == string.reverse
    'It`s a palindrome'
  elsif string.gsub(' ', '') == string.reverse.gsub(' ', '')
    'It`s a palindrome, no spaces'
  else
    'It`s not a palindrome'
  end
end
