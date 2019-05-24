import 'bootstrap';
import { initUpdateNavbarOnScroll } from 'components/navbar';
import { initSelect2 } from 'components/init_select2';
import 'select2/dist/css/select2.css';
import { animateSearchField } from 'components/search_field';
import { animateNewCocktailNameField } from 'components/new_cocktail_name_field';
import { newCocktailCreateButtonBehaviour } from 'components/new_cocktail_create_button';


initUpdateNavbarOnScroll();
initSelect2();
newCocktailCreateButtonBehaviour();
animateNewCocktailNameField();
animateSearchField();
