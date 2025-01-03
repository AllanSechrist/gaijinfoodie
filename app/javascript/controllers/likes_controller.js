import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["count"];

  like(event) {
    event.preventDefault();

    const url = this.element.dataset.likesUrl;

    fetch(url, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      }
    })
      .then(response => response.json())
      .then(data => {
        this.countTarget.textContent = data.likes;
      });
  }
}
