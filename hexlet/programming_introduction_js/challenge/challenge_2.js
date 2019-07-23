function sumSquareDifference(value) {
  let acc = 0;
  let accSQR = 0;

  for (let i = 1; i <= value; i++)
    acc += i * i;

  for (let i = 1; i <= value; i++)
    accSQR += i;

  return accSQR ** 2 - acc;
}
