import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['button', 'input', 'form', 'card']

  connect() {
    console.log(this.buttonTarget)
    console.log(this.cardTarget)
    console.log('test connect')
  }

  toggleInput(event) {
    this.formTarget.classList.toggle("hidden")
  }

  submit(event) {
    console.log("start submit")

    console.log(this.inputTarget.value)
    const url = `/chatbot?message=${this.inputTarget.value}`
    fetch(url, {
      headers: {"Accept": "text/plain"}
    })
    .then(response => response.text())
    .then((data) => {
      this.cardTarget.innerHTML = `${data}`
      console.log(data)
    })
    .catch(error => console.log(error))

    console.log("end submit")
  }
}
