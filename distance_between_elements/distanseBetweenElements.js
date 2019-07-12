function betweenDistance(array) {
  let distanceArray = [];
  let maxRange;

  for (let i = 0; i < array.length; i++ ) {
    for (let j = i; j < array.length; j++) {
      if (array[i] == array[j]) {
        distanceArray.push(j - i);
      }
    }
  }

  maxRange = Math.max.apply(null, distanceArray);
  return maxRange;
}
