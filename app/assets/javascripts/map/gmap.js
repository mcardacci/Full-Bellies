var marker;
function createMarker(coords, map, title){
  marker = new google.maps.Marker({
    position: coords,
    map: map,
    title: title
  });
}

function createImage(url){
  var image = {
    url: url,
    // This marker is 32 pixels wide by 32 pixels tall.
    size: new google.maps.Size(32, 32),
    // The origin for this image is 0,0.
    origin: new google.maps.Point(0,0),
    // The anchor for this image is the base of the flagpole at 0,32.
    anchor: new google.maps.Point(0, 32)
  };
  return image;
}

function createCustomMarker(coords,map,title){
  marker = new google.maps.Marker({
    position: coords,
    map: map,
    title: title,
    // icon: createImage("/assets/icon.png")
  });
}

function createInfoWindow(text){
  var infowindow = new google.maps.InfoWindow({
    content: text
  });
  return infowindow;
}

var info = createInfoWindow("Congratulations!");
google.maps.event.addListener(marker, 'click', function() {
  info.open(map,marker);
});







//to pin drop on an address
// map here is your google.map.Map element

//     var myLatlng = new google.maps
// geocoder.geocode({ 'address': addressThatYouWannaDraw }, function (results, status) {
//     if (status == google.maps.GeocoderStatus.OK) {
//       pt = results[0].geometry.location;

//       var myMarkerOpts = {
//         position: pt,
//         map: map
//       };

//       var marker = new google.maps.Marker(myMarkerOpts);
//     }
//   });

//experiment!!
// function initialize() {
//   var myLatlng = new google.maps.LatLng(-25.363882,131.044922);
//   var mapOptions = {
//     zoom: 8,
//     center: myLatlng
//   }
//   var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
//   var marker = new google.maps.Marker({
//     position: myLatlng,
//     map: map,
//     title: 'Hello World!'
//   });
// }

// google.maps.event.addDomListener(window, 'load', initialize);
