function sortArray(unsortedArray) {
  for (let j = 0; j < unsortedArray.length - 1; j++){
    for (let i = 0; i < unsortedArray.length - 1; i++) {
      if (unsortedArray[i] > unsortedArray[i +1]) {
        sortedArray[i], sortedArray[i + 1] = sortedArray[i + 1], sortedArray[i];
      }
    }
  }
  return unsortedArray;
}
