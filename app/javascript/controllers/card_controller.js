import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card"
export default class extends Controller {

  display() {
    console.log('Kali')
    const card = document.createElement("div")
    console.log(card)
    card.innerHTML = 'Coucou'
    console.log(card)
  }
}
