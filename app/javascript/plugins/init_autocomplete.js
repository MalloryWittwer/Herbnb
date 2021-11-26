import places from "places.js";

const initAutocomplete = () => {
  const addressInput = document.getElementById("user_address");
  if (addressInput) {
    places({ container: addressInput });
  }
  const searchInput = document.getElementById("search-input");
  if (searchInput) {
    places({ container: searchInput });
  }
  const addresseditInput = document.getElementById("edit_address");
  console.log(addresseditInput);
  if (addresseditInput) {
    places({ container: addresseditInput });
  }
};

export { initAutocomplete };
