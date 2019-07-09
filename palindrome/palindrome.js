function palindrome(value) {
  let valueWithNoSpaces = value.replace(/\s/g,'');
  if (value === value.split('').reverse().join('')) {
      return 'It`s a palindrome';
  } else if (valueWithNoSpaces === valueWithNoSpaces.split('').reverse().join('')) {
      return 'It`s a palindrome, no spaces';
  }
  return 'It`s not a palindrome';
}
