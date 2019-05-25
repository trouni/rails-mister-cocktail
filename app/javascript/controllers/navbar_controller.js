import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "navbar", "banner" ]

  toggleBackground() {
    console.log("scroll")
    const navbar = this.navbarTarget;
    const banner = this.bannerTarget;
    if (window.scrollY >= banner.clientHeight - navbar.clientHeight) {
      navbar.classList.add('navbar-hipsterblends-visible');
    } else {
      navbar.classList.remove('navbar-hipsterblends-visible');
    }
  }
}
