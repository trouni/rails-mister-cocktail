import Typed from 'typed.js';

const animateNewCocktailNameField = () => {
  new Typed('#cocktail_name', {
    strings: ["Type your cocktail name..."],
    typeSpeed: 30,
    showCursor: true,
    attr: 'placeholder',
    loop: false
  });
}

export { animateNewCocktailNameField };
