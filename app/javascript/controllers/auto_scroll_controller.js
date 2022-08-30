import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    var objDiv2 = document.getElementById("messages");
    objDiv2.scrollTop = objDiv2.scrollHeight;
  }
}
