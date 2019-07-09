function palindrome (string) {
  const stringReverse = string.split("").reverse().join("");
  const stringDelSpaces = string.replace(/\s/g,'');
  const stringDelSpacesReverse = stringDelSpaces.split("").reverse().join("");

  if (string === stringReverse) {
      return 'It`s a palindrome';
  } else if (stringDelSpaces === stringDelSpacesReverse) {
      return 'It`s a palindrome, no spaces';
  } else {
      return 'It`s not a palindrome';
  }
}
