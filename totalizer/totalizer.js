function totalizator (num) {
    var random_num = (Math.random() * (10));
    var random_num_round = (Math.round(random_num))
    if (num == random_num_round) {
        console.log('Winner!')
    }
    else {
        console.log('You lose! victory number:' + (random_num_round),', your number:' +(num))
    }
}

totalizator(3)
