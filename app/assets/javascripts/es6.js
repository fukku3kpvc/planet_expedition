$(function () {
    let coin = new Promise((resolve, reject) => {
        let rand = Math.round(Math.random()*100);

        window.setTimeout(() => {
            if (rand > 50) {
                reject('Решка');
            }
            else {
                resolve('Орел');
            }
            console.log(rand);
        }, Math.round(Math.random()*1000))
    });

    coin
        .then((result) => console.log(result))
        .catch((err) => console.error(err));

    fetch('https://api.hh.ru/vacancies?text=rails')
        .then((response) => response.json())
        .then((result) => console.log(result))
        .catch((err) => console.error(err));
});