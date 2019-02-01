$(function () {

    let tbody = document.createElement('tbody');

    $('#search-btn').on('click', doSearch);
    $('#InputQuery').keydown(function (e) {
        if (e.keyCode === 13) {
            console.log(e.keyCode);
            e.preventDefault();
            $('#search-btn').click();
        }
    });


    function doSearch(e) {
        e.preventDefault();
        if (!$('.container').children().hasClass('table-container')) {
            vacancySearch();
        }
        else {
            $('#search-table tr').remove();
            $('.table-container').remove();
            vacancySearch();
        }
    }

    function vacancySearch() {
        createTable();
        let URL = "https://api.hh.ru/vacancies?text=";
        let query;
        query = $('#InputQuery').val();
        URL += query;
        fetch(URL)
            .then((response) => { return response.json(); })
            .then((result) => result.items.forEach((item) => {
                console.log(result);
                let tr = document.createElement('tr');
                tbody.appendChild(tr);
                let td1 = document.createElement('td');
                let td2 = document.createElement('td');
                let td3 = document.createElement('td');
                td1.innerHTML = `<a href="${item.alternate_url}">${item.name}</a>`;
                td2.innerText = item.area.name;
                item.salary !== null ? td3.innerText = `${item.salary.from} - ${item.salary.to}` : td3.innerText = 'Не указан';
                tr.appendChild(td1);
                tr.appendChild(td2);
                tr.appendChild(td3);
        }))
            .catch((err) => console.error(`error ${err}`));
    }

    function createTable() {
        let container = document.getElementsByClassName('container');
        let table_container = document.createElement('div');
        table_container.setAttribute('class', 'table-container');
        let table = document.createElement('table');
        table.className = 'table table-sm';
        table.setAttribute('id', 'search-table');
        container[0].appendChild(table_container);
        table_container.appendChild(table);
        let thead = document.createElement('thead');
        table.appendChild(thead);
        let tr = document.createElement('tr');
        thead.appendChild(tr);
        let th1 = document.createElement('th');
        let th2 = document.createElement('th');
        let th3 = document.createElement('th');
        th1.setAttribute('scope', 'col');
        th2.setAttribute('scope', 'col');
        th3.setAttribute('scope', 'col');
        th1.innerHTML = 'Вакансия';
        th2.innerHTML = 'Регион';
        th3.innerHTML = 'Оклад';
        tr.appendChild(th1);
        tr.appendChild(th2);
        tr.appendChild(th3);
        table.appendChild(tbody);
    }
});