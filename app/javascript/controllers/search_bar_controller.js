import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = []

  connect() {
    console.log("Hello from search bar controller")
  }

  move() {
    const scrollPos = window.scrollY / 4;
    console.log(scrollPos);
    if ( window.scrollY > 10 ) {
      this.element.style.top = "50%"
    }
    else {
      this.element.style.top = '100%'
    }
  }
}
