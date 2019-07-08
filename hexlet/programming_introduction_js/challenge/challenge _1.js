function isPerfect(value) {
  let dividers = [];
  let acc = 0;

  for (let i = 0; i < value; i++) {
    if (value % i === 0)
      dividers.push(i)
  }

  for (let i = 0; i < dividers.length; i++)
    acc += dividers[i];

  return acc === value;
}
