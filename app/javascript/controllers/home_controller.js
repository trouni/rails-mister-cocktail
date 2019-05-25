import { Controller } from "stimulus"
import Typed from 'typed.js';

export default class extends Controller {
  static targets = [ "searchInput" ]

  connect() {
    new Typed('#home_search_keyword', {
      strings: ["Mint", "Gin", "Old Fashioned", "Rum", "Strawberry"],
      typeSpeed: 40,
      backSpeed: 20,
      startDelay: 100,
      attr: 'placeholder',
      loop: true
    });
  }
}
