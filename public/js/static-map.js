/* global $, google */
var mapStyles = [{
  'elementType': 'geometry',
  'stylers': [{
    'color': '#f5f5f5'
  }]
  },
  {
    'elementType': 'labels.icon',
    'stylers': [{
      'visibility': 'off'
    }]
  },
  {
    'elementType': 'labels.text.fill',
    'stylers': [{
      'color': '#616161'
    }]
  },
  {
    'elementType': 'labels.text.stroke',
    'stylers': [{
      'color': '#f5f5f5'
    }]
  },
  {
    'featureType': 'administrative.land_parcel',
    'elementType': 'labels.text.fill',
    'stylers': [{
      'color': '#bdbdbd'
    }]
  },
  {
    'featureType': 'poi',
    'elementType': 'geometry',
    'stylers': [{
      'color': '#eeeeee'
    }]
  },
  {
    'featureType': 'poi',
    'elementType': 'labels.text.fill',
    'stylers': [{
      'color': '#757575'
    }]
  },
  {
    'featureType': 'poi.park',
    'elementType': 'geometry',
    'stylers': [{
      'color': '#e5e5e5'
    }]
  },
  {
    'featureType': 'poi.park',
    'elementType': 'labels.text.fill',
    'stylers': [{
      'color': '#9e9e9e'
    }]
  },
  {
    'featureType': 'road',
    'elementType': 'geometry',
    'stylers': [{
      'color': '#ffffff'
    }]
  },
  {
    'featureType': 'road.arterial',
    'elementType': 'labels.text.fill',
    'stylers': [{
      'color': '#757575'
    }]
  },
  {
    'featureType': 'road.highway',
    'elementType': 'geometry',
    'stylers': [{
      'color': '#dadada'
    }]
  },
  {
    'featureType': 'road.highway',
    'elementType': 'labels.text.fill',
    'stylers': [{
      'color': '#616161'
    }]
  },
  {
    'featureType': 'road.local',
    'elementType': 'labels.text.fill',
    'stylers': [{
      'color': '#9e9e9e'
    }]
  },
  {
    'featureType': 'transit.line',
    'elementType': 'geometry',
    'stylers': [{
      'color': '#e5e5e5'
    }]
  },
  {
    'featureType': 'transit.station',
    'elementType': 'geometry',
    'stylers': [{
      'color': '#eeeeee'
    }]
  },
  {
    'featureType': 'water',
    'elementType': 'geometry',
    'stylers': [{
      'color': '#c9c9c9'
    }]
  },
  {
    'featureType': 'water',
    'elementType': 'labels.text.fill',
    'stylers': [{
      'color': '#9e9e9e'
    }]
  }
];
var map;
var marker;

function initMap() {
  var userPosition = navigator.geolocation.getCurrentPosition(success);
  var startLatLng = {lat: lat, lng: lng};

  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 12,
    center: startLatLng,
    styles:mapStyles
  });

  var image = '../img/map/marker.png';
  var markerContent = '<div id="marker-2" class="flip-container">' +
        '<div class="flipper">' +
        '<div class="front">' +
        '<img src="' + raceImage + '">' +
        '</div>' +
        '<div class="back">' +
        '<i class="fa fa-star"></i>' +
        '</div>' +
        '</div>' +
        '</div>';
  marker = new RichMarker({
    id: 2,
    position: new google.maps.LatLng(lat, lng),
    map: map,
    content: markerContent
  });

  function success(userPosition) {
    var thumbnail = '../img/map/marker-front.png';
    var markerContent = '<div id="marker-1" class="flip-container">' +
          '<div class="flipper">' +
          '<div class="front">' +
          '<img src="' + currentUserThumbnail + '">' +
          '</div>' +
          '<div class="back">' +
          '<i class="fa fa-star"></i>' +
          '</div>' +
          '</div>' +
          '</div>';
    var markerCenter = new google.maps.LatLng(userPosition.coords.latitude, userPosition.coords.longitude);
    var userMarker = new RichMarker({
      id: 1,
      position: markerCenter,
      map: map,
      content: markerContent,
      flat: true,
      shadow: 0
    });    
  }

  var lineCoordinatesPath = new google.maps.Polyline({
    path: lineCoords,
    geodesic: true,
    strokeColor: '#888888'
  });  

  lineCoordinatesPath.setMap(map);
}



var id = document.getElementById('map');
if (id) {
  initMap();
}






