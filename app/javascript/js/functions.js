// var messages2 = document.querySelector('#messages2');
// console.log(messages2);
// messages2.scrollTop = messages2.scrollHeight;
testF = function() {
  alert('got alert!')
}
document.addEventListener("turbolinks:load", function() {
  var objDiv = document.getElementById("messages2");
  objDiv.scrollTop = objDiv.scrollHeight;

});

document.addEventListener("turbo:before-fetch-response", function (e) {
  var objDiv2 = document.getElementById("messages2");
  objDiv2.scrollTop = objDiv2.scrollHeight;
  console.log(event.detail);
});
