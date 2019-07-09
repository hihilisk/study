function palindrome (string) {
  if (string === string.split("").reverse().join("")) {
      return 'It`s a palindrome';
  } else if (string.replace(/\s/g,'') === string.replace(/\s/g,'').split("").reverse().join("") ) {
      return 'It`s a palindrome, no spaces';
  } else {
      return 'It`s not a palindrome';
  }
}
