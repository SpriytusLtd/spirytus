var map, geo;
function initMap() {
  var latlng = new google.maps.LatLng(36, 138);
  var opts = {
    zoom: 5,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    center: latlng
  };

  map = new google.maps.Map(document.getElementById("map"), opts);
  geo = new google.maps.Geocoder();
}

function search_address() {
  var req = {
    address: document.getElementById("input_store_address").value,
  };
  geo.geocode(req, function(result, status) {
    if (status != google.maps.GeocoderStatus.OK) {
      alert(status);
      return;
    }
    var latlng = result[0].geometry.location;
    map.setCenter(latlng);
    map.setZoom(13);
    var marker = new google.maps.Marker({position: latlng, map: map, title: latlng.toString(), draggable: true});
    google.maps.event.addListener(marker, 'dragend', function(e) {
      marker.setTitle(e.latLng.toString());
    });
    document.getElementById("latlngtext").innerHTML = document.getElementById("input_store_address").value + " : " + latlng.toString();
  });
}

initMap();
search_address();
