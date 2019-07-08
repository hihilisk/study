function totalizer (number) {
  const randomNumber = (Math.random() * (10));
  const randomNumberRound = (Math.round(randomNumber));

  if (number === randomNumberRound) {
    return 'Winner';
  }
  else {
    return 'You lost';
  }
}

totalizer(3)