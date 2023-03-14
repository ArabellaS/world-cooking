import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['button', 'input', 'form']

  connect() {
    console.log('beat it')
    console.log(this.buttonTarget)
    console.log('hello')
  }

  toggleInput(event) {
    this.formTarget.classList.toggle("hidden")
  }

  submit(event) {
    console.log(this.inputTarget.value)
    const url = `/chatbot?message=${this.inputTarget.value}`
    fetch(url, { headers: {"Accept": "application/json"}}).then(response => response.json()).then(data => console.log(data))
    console.log("j'ai clické")
  }
}
