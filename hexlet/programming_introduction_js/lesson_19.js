export default (value) => {
  let resultString = value[0].toUpperCase();

  for (let i = 0; i < value.length - 1; i++) {
    if (value[i] === ' ') {
      resultString += value[i + 1].toUpperCase();
    } else if (value[i] !== ' ') {
      resultString += (value[i + 1]);
    }
  }

  return String(resultString);
};
