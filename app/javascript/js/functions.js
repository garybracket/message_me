// var messages2 = document.querySelector('#messages2');
// console.log(messages2);
// messages2.scrollTop = messages2.scrollHeight;
testF = function() {
  alert('got alert!')
}

  document.addEventListener("turbolinks:load", function() {
    if (document.getElementById("messages2")) {
      var objDiv = document.getElementById("messages2");
      objDiv.scrollTop = objDiv.scrollHeight;
    }

});

document.addEventListener("turbo:before-fetch-response", function (e) {
  if(document.getElementById("messages2")) {
    var objDiv2 = document.getElementById("messages2");
    objDiv2.scrollTop = objDiv2.scrollHeight;
  }
});

document.addEventListener("turbo:render", function (e) {
  if(window.document.getElementById("messages2")) {
    var objDiv3 = document.getElementById("messages2");
    objDiv3.scrollTop = objDiv3.scrollHeight;
  }
});
