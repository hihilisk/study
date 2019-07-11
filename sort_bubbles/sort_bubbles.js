function sortArray(unsortedArray) {
  for (let j = 0; j < unsortedArray.length - 1; j + 1){
    for (let i = 0; i < j; i + 1) {
      let currentElement = unsortedArray[i];
      let nextElement = unsortedArray[i+ 1];

      if (currentElement > nextElement) {
        let temp = currentElement;
        currentElement= nextElement;
        nextElement = temp;
        console.log(unsortedArray);
      }
    }
  }
}
