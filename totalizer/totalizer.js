function totalizer (number) {
  let randomNumber = (Math.random() * (10));
  let randomNumberRound = (Math.round(randomNumber));

  if (number === randomNumberRound) {
   let result = ('Winner!');
   console.log(result)
   return result = true;
  }
  else {
   let resultText = ('You lose! victory number:' + (randomNumberRound));
   let result = resultText.concat(', your number:' +(number));
   console.log(result)
   return result = false;
  }
}

totalizer(3)