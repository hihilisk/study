const smallestDivisor = (value) => {
  let minDelitel = 2;

  if (value === 0 || value < 0) {
    return NaN;
  }

  if (value === 1) {
     return 1;
  }

  while (minDelitel <= value) {
    if (value % minDelitel == false) {
      return minDelitel;
    }

    minDelitel++;
  }
  return minDelitel;
};
