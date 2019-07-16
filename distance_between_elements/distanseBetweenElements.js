function betweenDistance(array,item) {
  let distanceArray = [];
  let maxRange = 'элемент ' + item + ' не найден, или массив пуст';

  for (let j = 0; j < array.length - 1; j++) {
    if (item === array[j]) {
      distanceArray.push(j);
    }
  }

  if (distanceArray.length === 1) {
    maxRange = distanceArray[0] - 1;

    return maxRange;
  } else if (distanceArray.length > 1) {
    maxRange = distanceArray[distanceArray.length -1] - distanceArray[0];

    return maxRange;
  }

  return maxRange;
}
