function anagramma(firstWord, secondWord) {
  let acc = '';
  let temp = '';
  firstWord = firstWord.toLowerCase();
  secondWord = secondWord.toLowerCase();

  if (firstWord.length === secondWord.length) {

    for (let i = 0; i < firstWord.length; i++) {
      for (let j = 0; j < secondWord.length; j++) {
        if (firstWord[i] === secondWord[j]) {
          temp = temp + firstWord[i];
        }
      }
    }

    for (let k = 0; k <temp.length; k++) {
      if (temp[k] !== temp[k + 1]) {
        acc = acc + temp[k]
      }
    }
  }
  return console.log(acc);
}
 console.log(anagramma('sTollol', 'slollot'));