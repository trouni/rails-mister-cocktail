import { Controller } from "stimulus"
import Typed from 'typed.js';

export default class extends Controller {
  static targets = [ "btnCreate" ]

  connect() {
    new Typed('#cocktail_name', {
      strings: ["Type your cocktail name..."],
      typeSpeed: 30,
      showCursor: true,
      attr: 'placeholder',
      loop: false
    })
  }

  showBtn() {
    const button = this.btnCreateTarget
    button.classList.remove("hidden")
  }
  hideBtn() {
    const button = this.btnCreateTarget
    button.classList.add("hidden")
  }
}


