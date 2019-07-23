function findElement(array, value) {
  let findItem;

    for (let i = 0; i < array.length; i++) {
      if (array[i] == value) {
         findItem = array[i];
      }
    }

  return findItem;
}
