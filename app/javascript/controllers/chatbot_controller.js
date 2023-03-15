import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['button', 'input', 'form']

  connect() {
    console.log('beat it')
    console.log(this.buttonTarget)
    console.log('hello test')
  }

  toggleInput(event) {
    this.formTarget.classList.toggle("hidden")
  }

  submit(event) {
    console.log(this.inputTarget.value)
    const url = `/chatbot?message=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}}).then(response => response.text()).then(data => console.log(data))
    console.log("j'ai clické")
  }
}
