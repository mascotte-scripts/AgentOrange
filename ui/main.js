function post(url, data){
    fetch(url, {
        async: true,
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data),
    })
}

window.addEventListener('message', event => {
    let item = event.data;
    eventData = item;
    if (item.type === 'ui') {
      // Then do something
    }
  })