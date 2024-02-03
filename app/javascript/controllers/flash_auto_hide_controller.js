import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash-auto-hide"
export default class extends Controller {
  connect() {
    // console.log("Connecting to data-controller=flash-auto-hide");
    setTimeout(() => {
      this.dismiss();
    }, 10000)
  }

  dismiss() {
    this.element.remove();
  }
}
