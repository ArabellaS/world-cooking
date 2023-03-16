import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['button', 'input', 'form', 'card']

  toggleInput(event) {
    this.formTarget.classList.toggle("hidden")
  }

  submit(event) {
    const url = `/chatbot?message=${this.inputTarget.value}`
    fetch(url, {
      headers: {"Accept": "text/plain"}
    })
    .then(response => response.text())
    .then((data) => {
      this.cardTarget.innerHTML = `${data}`
    })
    // .then(data => console.log(data))
    // .then(data => this.cardTarget.innerHTML = `<p>${data}</p>`)
    // .catch(error => console.log(error));
  }
}
