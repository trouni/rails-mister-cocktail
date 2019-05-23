const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-blendadvisor');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-blendadvisor-bgblue');
      } else {
        navbar.classList.remove('navbar-blendadvisor-bgblue');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
