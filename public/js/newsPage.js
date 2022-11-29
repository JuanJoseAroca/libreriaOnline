document.querySelector('#loadBtn2').addEventListener('click', (e) => {
    let page = parseInt(e.target.dataset.page);
    let loadPage = new Request(`/ajax/loadPageNews?page=${page}`, {method: 'GET'});
    fetch(loadPage)
        .then(response => response.text())
        .then(data => {
            if (!data.includes('false')) {
                let parser = new DOMParser();
                let append = parser.parseFromString(data, 'text/html');
                for (let child of append.body.childNodes) {
                    
                    document.querySelector('#productsList2').appendChild(child);
                }
                e.target.dataset.page = page + 1;
            } else {
                e.target.innerText = 'No hay más productos 😔'
            }
    });
});