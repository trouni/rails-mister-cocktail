import Typed from 'typed.js';

const animateSearchField = () => {
  new Typed('#home_search_keyword', {
    strings: ["Gin & Tonic", "Peppermint", "Old Fashioned", "Rum", "Strawberry"],
    typeSpeed: 40,
    backSpeed: 20,
    startDelay: 100,
    bindInputFocusEvents: true,
    attr: 'placeholder',
    loop: true
  });
}

export { animateSearchField };
