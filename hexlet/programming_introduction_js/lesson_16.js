const square = (value => value * value);

function sumOfSquares(value, valueTwo) {
  return square(value) + square(valueTwo);
}

function squareSumOfSquares(value, valueTwo) {
  return square(sumOfSquares(value, valueTwo));
}
