import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('flat_location');
  if (addressInput) {
    places({ container: addressInput });
  }
};

initAutocomplete();


const initAutocompleteSearch = () => {
  const searchInput = document.getElementById('inputLocation');
  if (searchInput) {
    places({ container: searchInput });
  }
};

initAutocomplete();


