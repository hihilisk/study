function palindrome(string) {
  let stringReplaceSpace=string.replace(/\s/g,'');
  if (string===string.split('').reverse().join('')) {
      return 'It`s a palindrome';
  } else if (stringReplaceSpace===stringReplaceSpace.split('').reverse().join('')) {
      return 'It`s a palindrome, no spaces';
  } else {
      return 'It`s not a palindrome';
  }
}
