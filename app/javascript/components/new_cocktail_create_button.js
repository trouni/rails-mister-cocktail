const newCocktailCreateButtonBehaviour = () => {
  const button = document.getElementById("create-cocktail-submit");
  const input = document.getElementById("cocktail_name");
  input.addEventListener("focus", (event) => {
    console.log("focus");
    button.classList.remove("hidden");
  });
  input.addEventListener('blur', (event) => {
    console.log("blur");
    button.classList.add("hidden");;
  });
};

export { newCocktailCreateButtonBehaviour };
