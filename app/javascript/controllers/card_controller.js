import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card"
export default class extends Controller {

  displayCard(event) {
    const placeId = event.params.placeId
    const transform = this.element.parentElement.style.transform
    document.querySelectorAll('.flip-card').forEach((card) => {
      card.classList.add('display-none')
    })
    // this.element.nextElementSibling.classList.remove('display-none')
    this.#createCard(placeId, transform)
  }

  #createCard(placeId, transform) {
    const transform_formatted = transform.replaceAll('%', '%25')
    const url = `/get_card?&place=${placeId}&transform=${transform_formatted}`
    fetch(url, {headers: {"Accept": "text/plain"}} ).then(response => response.text()).then(data => this.#addCardToMap(data))
  }

  #addCardToMap(data) {
    document.getElementById('map').insertAdjacentHTML('beforeend', data)
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

  closeCard() {
    this.element.querySelector(".flip-card").classList.add("display-none");
  }

}
