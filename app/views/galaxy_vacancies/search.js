$(function () {
    let query;

    $('#search-btn').on('click', getInputVal);

    function getInputVal(event) {
        event.preventDefault();
        query = $('#InputQuery').val();
        fetch('https://api.hh.ru/vacancies?text=${query}')
            .then((response) => response.json())
            .then((result) => console.log(result))
            .catch((err) => console.error(err))
    }
});