import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "displayable" ]

  connect() {
    console.log("Display controller connected")
  }

  display() {
    console.log("Display method called")
    if (this.hasDisplayableTarget) {
      console.log("Toggling displayable")
      this.displayableTarget.classList.toggle("d-none");
    } else {
      console.log("No displayable target found")
    }
  }
}