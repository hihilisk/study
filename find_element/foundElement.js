function foundElement(array, value) {
  let foundItem = value + ' no found';

  for (let i = 0; i < array.length - 1; i++) {
    if (array[i] === value) {
      foundItem = array[i];
    }
  }

  return foundItem;
}
