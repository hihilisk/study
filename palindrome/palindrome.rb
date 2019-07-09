check_palindrome = ->(string) {
  if string == string.reverse
    'It`s a palindrome'
  else
    'It`s not a palindrome'
  end
}

def palindrome(string, check_palindrome)
  check_palindrome.call(string)
end

def palindrome_no_spaces(string, check_palindrome)
  string = string.gsub(' ', '')
  check_palindrome.call(string)
end
