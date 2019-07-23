const smallestDivisor = (num) => {
  // BEGIN (write your solution here)
  let minDelitel = 0;

  if (num === 0) {
    return NaN;
  }

  if (num === 1) {
    return 1;
  }

  for (minDelitel = 2; minDelitel <= num; minDelitel++) {
    if (num % minDelitel == false) {
      return minDelitel;
    }
  }
  // END
};
