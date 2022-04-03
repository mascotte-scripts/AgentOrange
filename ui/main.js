let post = (url, data) => {
    fetch(url, {
        async: false,
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data),
    })
}

window.addEventListener('message', function(event){
    let item = event.data;
    eventData = item;
    if (item.status === true) {
      resourcename = item.resourcename
      DisplayHtmlElement('container')
    }
})

window.addEventListener('keyup', event => {
  if (event.keyCode === 27) {
    DisplayHtmlElement('container')
    post(`https://${resourcename}/exit`, {});
  }
})

  let DisplayHtmlElement = (module) => {
    var x = document.getElementById(module);
    if (x.style.display === "block") {
      x.style.display = "none";
    } else {
      x.style.display = "block";
    }
  }

  document.getElementById("exit-button").onmousedown = () => {
    DisplayHtmlElement('container')
    post(`https://${resourcename}/exit`, {});
    return true;
};