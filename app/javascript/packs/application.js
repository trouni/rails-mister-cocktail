import 'bootstrap';
import { initUpdateNavbarOnScroll } from 'components/navbar';
import { initSelect2 } from 'components/init_select2';
import 'select2/dist/css/select2.css';
import { animateSearchField } from 'components/search_field';

initUpdateNavbarOnScroll();
initSelect2();
animateSearchField();
