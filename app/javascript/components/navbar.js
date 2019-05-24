const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-hipsterblends');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-hipsterblends-visible');
      } else {
        navbar.classList.remove('navbar-hipsterblends-visible');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
