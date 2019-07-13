const sequenceSum = (begin, end) => {
  // BEGIN (write your solution here)
  let acc = 0;

  if (begin > end) {
    return NaN;
  }
  if (begin === end) {
    return begin;
  }

  return begin = begin + sequenceSum(begin + 1, end);
  // END
};
