
import "../plugins/flatpickr"
import { loadDynamicBannerText } from './components/banner'

import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';


import { initMapbox } from '../plugins/init_mapbox.js'

initMapbox();
loadDynamicBannerText();
