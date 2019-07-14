const bigLettersCount = (str) => {
  // BEGIN (write your solution here)
  let counter = 0;

  for (let i = 0; i < str.length; i++)
    if (str[i].toUpperCase() === str[i]) { counter++ }

    return counter;
  // END
};


const compare = (first, second) => {
  const firstCount = bigLettersCount(first);
  const secondCount = bigLettersCount(second);

  // BEGIN (write your solution here)
  if (firstCount > secondCount) {return 1}

  if (firstCount < secondCount) {return -1}

  return 0;
  // END
};
