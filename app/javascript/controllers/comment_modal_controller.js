import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment-modal"
export default class extends Controller {
  connect() {
    console.log("connected to the data-controller='comment-modal'");
  }

  submitEnd(event) {
    console.log("removingthe");
    if(event.detail.success) {
      this.hideModal();
    }
  }

  hideModal() {
    this.element.remove();
  }
}
