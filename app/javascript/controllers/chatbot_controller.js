import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.addEventListener("click", () => {
      window.open("profile", "_blank", "width=400,height=600");
    });
  }
}
