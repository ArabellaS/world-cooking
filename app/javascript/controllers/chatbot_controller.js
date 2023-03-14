import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['button', 'input']

  connect() {
    console.log('hey yo')
    console.log(this.buttonTarget)
  }

  toggleInput(event) {
    this.inputTarget.classList.toggle("hidden");
    console.log("j'ai clické")
  }

  submit() {
    const newItem = this.inputTarget.value.trim();
    // Do something with the new item
    this.inputTarget.value = "";
    
  }
}
