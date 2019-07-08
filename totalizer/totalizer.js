function totalizator (number) {
  const randomNumber = Math.round(Math.random() * 10);
  if (number === randomNumber) {
    return 'Winner';
  } else {
    return 'You lost';
  }
}
