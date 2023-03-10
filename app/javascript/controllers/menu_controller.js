import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['menu']

  connect() {
    console.log(this.menuTarget)
  }

  toggleMenu() {
    this.menuTarget.classList.toggle('display-none')
  }

  get menuTarget() {
    return this.targets.find('menu')
  }
}
