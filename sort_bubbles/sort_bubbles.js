function sortArray(unsortedArray) {
    let sortedArray= unsortedArray;
    let arrayLength = sortedArray.length -1;

    for (let j = 0; j < arrayLength; j + 1){
        for (let i = 0; i < arrayLength; i + 1) {

            if (sortedArray[i] > sortedArray[i +1]) {
                sortedArray[i], sortedArray[i + 1] = sortedArray[i + 1], sortedArray[i];
            }
        }
    }
    return sortedArray
}
