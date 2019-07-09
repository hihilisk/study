def palindrome(string)
  if string == string.reverse
    'It`s a palindrome'
  else
    'It`s not a palindrome'
  end
end

def palindrome_no_spaces(string)
  string_no_spaces = string.gsub(' ', '')
  if string_no_spaces == string_no_space.reverse
    'It`s a palindrome'
  else
    'It`s not a palindrome'
  end
end
