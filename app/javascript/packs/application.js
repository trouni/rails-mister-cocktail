// Import plugins
import 'bootstrap';
import { Application } from "stimulus"
import { autoload } from "stimulus/webpack-helpers"
import 'select2/dist/css/select2.css';

// Import components
import { initSelect2 } from 'components/init_select2';
import { initUpdateNavbarOnScroll } from 'components/navbar';

// Load stimulus controllers
const application = Application.start();
const controllers = require.context("./controllers", true, /\.js$/);
autoload(controllers, application);

// Initialize scripts
initUpdateNavbarOnScroll();
initSelect2();


