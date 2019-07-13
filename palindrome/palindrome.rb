def palindrome(string)
  string_no_spaces = string.gsub(' ', '')
  if string == string.reverse
    'It`s a palindrome'
  elsif string_no_spaces == string_no_spaces.reverse
    'It`s a palindrome, no spaces'
  else
    'It`s not a palindrome'
  end
end
