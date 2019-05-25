import { Controller } from "stimulus"

export default class extends Controller {
  toggleBackground() {
    const navbar = document.querySelector('.navbar-hipsterblends');
    if (window.scrollY >= window.innerHeight) {
      navbar.classList.add('navbar-hipsterblends-visible');
    } else {
      navbar.classList.remove('navbar-hipsterblends-visible');
    }
  }
}
