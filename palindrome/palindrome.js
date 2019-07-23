function palindrome(value) {
  const valueWithNoSpaces = value.replace(/\s/g, '');

  if (value === value.split('').reverse().join('')) {
    return 'It`s palindrome';
  } else if (valueWithNoSpaces === valueWithNoSpaces.split('').reverse().join('')) {
    return 'With no spaces, it`s palindrome';
  }

  return 'It`s not palindrome';
}
