import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "displayable" ]

  display() {
    console.log("hello");
    this.displayableTarget.classList.remove("d-none");
  }
}
