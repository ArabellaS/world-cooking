import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card"
export default class extends Controller {
  connect() {
    console.log("Bjr")
  }
}
