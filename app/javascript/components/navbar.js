const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-hipsterblend');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-hipsterblend-visible');
      } else {
        navbar.classList.remove('navbar-hipsterblend-visible');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
