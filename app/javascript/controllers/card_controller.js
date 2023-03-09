import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card"
export default class extends Controller {

  display() {
    console.log('Kali')
    const card = document.createElement("div")
    card.innerHTML = card.card_html
  }
}
