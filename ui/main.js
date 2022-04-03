let post = (url, data) => {
    fetch(url, {
        async: false,
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data),
    })
}

window.addEventListener('message', event =>{
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

  let DisplayHtmlElement = module => {
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

document.getElementById("execute-event-button").onmousedown = () => {
 let x = getInputForEventExecution()
 post(`https://${resourcename}/ExecuteEvent`, {x});
};

document.getElementById("execute-thread-button").onmousedown = () => {
  let x = getInputForThreadExecution()
  post(`https://${resourcename}/CreateClientThread`, {x});
 };

let getInputForEventExecution = () => {
    const eventInputData = {}
      eventInputData.eventType = document.getElementById("eventType").value
      eventInputData.eventName = document.getElementById("eventName").value
      eventInputData.eventTarget = document.getElementById("eventClientTarget").value
      eventInputData.arg1 = document.getElementById("event-arg-1").value
      eventInputData.arg2 = document.getElementById("event-arg-2").value
      eventInputData.arg3 = document.getElementById("event-arg-3").value
      eventInputData.arg4 = document.getElementById("event-arg-4").value
  return eventInputData
}

let getInputForThreadExecution = () => {
  const ThreadInputData = {}

return ThreadInputData
}