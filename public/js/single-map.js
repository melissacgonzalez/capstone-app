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
var chiMarathonCoords = [
  {lat: 41.88044, lng: -87.62075}, 
  {lat: 41.88182, lng: -87.62075}, 
  {lat: 41.88374, lng: -87.62059}, 
  {lat: 41.8864, lng: -87.62067}, 
  {lat: 41.88801, lng: -87.62062}, 
  {lat: 41.88915, lng: -87.6205}, 
  {lat: 41.89037, lng: -87.62023}, 
  {lat: 41.89181, lng: -87.62022}, 
  {lat: 41.89165, lng: -87.62806}, 
  {lat: 41.88883, lng: -87.62803}, 
  {lat: 41.88856, lng: -87.6279}, 
  {lat: 41.88423, lng: -87.62787}, 
  {lat: 41.87816, lng: -87.62766}, 
  {lat: 41.87814, lng: -87.63225}, 
  {lat: 41.88058, lng: -87.63232}, 
  {lat: 41.88363, lng: -87.6325}, 
  {lat: 41.88611, lng: -87.63246}, 
  {lat: 41.89267, lng: -87.63259}, 
  {lat: 41.91006, lng: -87.63311}, 
  {lat: 41.91294, lng: -87.63313}, 
  {lat: 41.91314, lng: -87.63296}, 
  {lat: 41.91326, lng: -87.63257}, 
  {lat: 41.91337, lng: -87.6317}, 
  {lat: 41.91391, lng: -87.63171}, 
  {lat: 41.91443, lng: -87.63201}, 
  {lat: 41.91502, lng: -87.63269}, 
  {lat: 41.91552, lng: -87.63284}, 
  {lat: 41.91611, lng: -87.63339}, 
  {lat: 41.91633, lng: -87.63368}, 
  {lat: 41.91684, lng: -87.63405}, 
  {lat: 41.91742, lng: -87.63424}, 
  {lat: 41.91861, lng: -87.63447}, 
  {lat: 41.91894, lng: -87.63458}, 
  {lat: 41.91922, lng: -87.63478}, 
  {lat: 41.91984, lng: -87.63542}, 
  {lat: 41.92017, lng: -87.63557}, 
  {lat: 41.92249, lng: -87.63571}, 
  {lat: 41.9248, lng: -87.63578}, 
  {lat: 41.92568, lng: -87.63604}, 
  {lat: 41.92566, lng: -87.63467}, 
  {lat: 41.925654, lng: -87.633605}, 
  {lat: 41.92644, lng: -87.63403}, 
  {lat: 41.9278, lng: -87.63476}, 
  {lat: 41.93114, lng: -87.63711}, 
  {lat: 41.93169, lng: -87.63772}, 
  {lat: 41.93237, lng: -87.63879}, 
  {lat: 41.9329, lng: -87.63932}, 
  {lat: 41.93793, lng: -87.63949}, 
  {lat: 41.94127, lng: -87.63954}, 
  {lat: 41.94227, lng: -87.63995}, 
  {lat: 41.94433, lng: -87.64102}, 
  {lat: 41.94865, lng: -87.64345}, 
  {lat: 41.94733, lng: -87.64727}, 
  {lat: 41.94273, lng: -87.64448}, 
  {lat: 41.93449, lng: -87.64424}, 
  {lat: 41.93424, lng: -87.64425}, 
  {lat: 41.93358, lng: -87.64468}, 
  {lat: 41.93279, lng: -87.6449}, 
  {lat: 41.93227, lng: -87.6448}, 
  {lat: 41.93176, lng: -87.64454}, 
  {lat: 41.93142, lng: -87.6443}, 
  {lat: 41.92998, lng: -87.64347}, 
  {lat: 41.92984, lng: -87.64319}, 
  {lat: 41.92959, lng: -87.64286}, 
  {lat: 41.92193, lng: -87.63828}, 
  {lat: 41.92191, lng: -87.63893}, 
  {lat: 41.91959, lng: -87.63883}, 
  {lat: 41.91106, lng: -87.63859}, 
  {lat: 41.91107, lng: -87.63471}, 
  {lat: 41.89986, lng: -87.63431}, 
  {lat: 41.88995, lng: -87.63403}, 
  {lat: 41.88994, lng: -87.63696}, 
  {lat: 41.88882, lng: -87.63694}, 
  {lat: 41.88853, lng: -87.63687}, 
  {lat: 41.88686, lng: -87.63536}, 
  {lat: 41.8851, lng: -87.63539}, 
  {lat: 41.87939, lng: -87.63526}, 
  {lat: 41.87929, lng: -87.6402}, 
  {lat: 41.87873, lng: -87.67656}, 
  {lat: 41.87619, lng: -87.67651}, 
  {lat: 41.87624, lng: -87.67566}, 
  {lat: 41.87626, lng: -87.67218}, 
  {lat: 41.87755, lng: -87.67067}, 
  {lat: 41.87793, lng: -87.64724}, 
  {lat: 41.8696, lng: -87.64695}, 
  {lat: 41.86949, lng: -87.65136}, 
  {lat: 41.86926, lng: -87.66652}, 
  {lat: 41.86352, lng: -87.66632}, 
  {lat: 41.86109, lng: -87.66618}, 
  {lat: 41.85775, lng: -87.66615}, 
  {lat: 41.85797, lng: -87.65557}, 
  {lat: 41.85808, lng: -87.64666}, 
  {lat: 41.85042, lng: -87.64642}, 
  {lat: 41.84933, lng: -87.64648}, 
  {lat: 41.84721, lng: -87.64646}, 
  {lat: 41.84825, lng: -87.64428}, 
  {lat: 41.84865, lng: -87.64274}, 
  {lat: 41.8494, lng: -87.64124}, 
  {lat: 41.84981, lng: -87.6405}, 
  {lat: 41.8503, lng: -87.6399}, 
  {lat: 41.85075, lng: -87.63913}, 
  {lat: 41.85282, lng: -87.63483}, 
  {lat: 41.85283, lng: -87.63201}, 
  {lat: 41.84814, lng: -87.63192}, 
  {lat: 41.84772, lng: -87.63205}, 
  {lat: 41.84714, lng: -87.63213}, 
  {lat: 41.84665, lng: -87.63212}, 
  {lat: 41.84566, lng: -87.63188}, 
  {lat: 41.84516, lng: -87.63185}, 
  {lat: 41.8375, lng: -87.63163}, 
  {lat: 41.8346, lng: -87.6316}, 
  {lat: 41.83468, lng: -87.62655}, 
  {lat: 41.83103, lng: -87.62647}, 
  {lat: 41.83105, lng: -87.62323}, 
  {lat: 41.8391, lng: -87.62348}, 
  {lat: 41.84641, lng: -87.6236}, 
  {lat: 41.84857, lng: -87.62369}, 
  {lat: 41.86747, lng: -87.62415}, 
  {lat: 41.86748, lng: -87.6219}, 
  {lat: 41.86753, lng: -87.62047}, 
  {lat: 41.87008, lng: -87.62051}
];

var index = 0;
var lat = chiMarathonCoords[index].lat;
var lng = chiMarathonCoords[index].lng;
var map;
var marker;
var lineCoords = [];

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

  setInterval(redraw, 3000);

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
  var chiMarathonPath = new google.maps.Polyline({
    path: chiMarathonCoords,
    geodesic: true,
    strokeColor: '#888888'
  });  

  chiMarathonPath.setMap(map);
}

var redraw = function() {
  var position = new google.maps.LatLng(lat, lng);
  marker.setPosition(position);
  lineCoords.push(position);

  var lineCoordinatesPath = new google.maps.Polyline({
    path: lineCoords,
    geodesic: true,
    strokeColor: '#2196f3'
  });   

  lineCoordinatesPath.setMap(map);
  index++;
  lat = chiMarathonCoords[index].lat;
  lng = chiMarathonCoords[index].lng;
};

var id = document.getElementById('map');
if (id) {
  initMap();
}






