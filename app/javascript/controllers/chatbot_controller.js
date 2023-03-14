import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['button', 'input']

  connect() {
    console.log('hey yo')
    console.log(this.buttonTarget)
  }

  toggleInput(event) {
    this.inputTarget.classList.toggle("hidden")
  }

  submit(event) {
    console.log(this.inputTarget)
    console.log("j'ai clické")
  }
}
