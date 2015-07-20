function init() {
  var input = document.getElementById('vendor_address');
  var autocomplete = new google.maps.places.Autocomplete(input);
}

google.maps.event.addDomListener(window, 'load', init);
