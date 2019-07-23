function diff(firstAngle, secondAngle) {
  const firstDegrees = (firstAngle > secondAngle) ? firstAngle : secondAngle;
  const secondDegrees = (firstAngle < secondAngle) ? firstAngle : secondAngle;
  let acc = firstDegrees - secondDegrees;

  if (acc > 180) {
    acc = 180 + (180 - acc);
  }

  return acc;
}
