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

  displayCard() {
    this.element.children[1].classList.remove('display-none')
  }

  rotateCard(event) {
    const card = event.currentTarget.firstElementChild
    let transform = card.style.transform
    transform = transform === 'rotateY(180deg)' ? 'rotateY(0deg)' : 'rotateY(180deg)'
    card.style.transform = transform
    Array.from(card.children).forEach((ca) => {
      ca.classList.toggle('display-none')
    })
  }
}
