function palindrome(value) {
  let valueWithNoSpaces = value.replace(/\s/g,'');
  switch (value) {
    case value.split('').reverse().join(''):
      return 'It`s a palindrome';
  }
  switch (valueWithNoSpaces) {
    case valueWithNoSpaces.split('').reverse().join(''):
      return 'It`s a palindrome, no spaces';
    default :
      return 'It`s not a palindrome';
  }
}
