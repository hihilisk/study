def palindrome(string)
  string_with_no_spaces = string.gsub(' ', '')

  if string == string.reverse
    'It`s palindrome'
  elsif string_with_no_spaces == string_with_no_spaces.reverse
    'With no spaces, it`s palindrome'
  else
    'It`s not palindrome'
  end
end
