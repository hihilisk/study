function areBracketsBalanced(value) {
    let firstCounter = 0;
    let secondCounter = 0;

    if (value.length % 2 === 0) {
        for (let i = 0; i < value.length; i++) {
            if (value[i] === '(') {
                firstCounter++;
            } else {
                secondCounter++;
            }
        }

        return (firstCounter === secondCounter);
    }

    return false;
}
