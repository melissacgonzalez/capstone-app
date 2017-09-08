/* global $, google, PubNub */
$(document).ready(function() {
  'use strict';
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

  var chiMarathonCoords = [{"latitude": 41.88044, "longitude": -87.62075}, {"latitude": 41.88182, "longitude": -87.62075}, {"latitude": 41.88374, "longitude": -87.62059}, {"latitude": 41.8864, "longitude": -87.62067}, {"latitude": 41.88801, "longitude": -87.62062}, {"latitude": 41.88915, "longitude": -87.6205}, {"latitude": 41.89037, "longitude": -87.62023}, {"latitude": 41.89181, "longitude": -87.62022}, {"latitude": 41.89165, "longitude": -87.62806}, {"latitude": 41.88883, "longitude": -87.62803}, {"latitude": 41.88856, "longitude": -87.6279}, {"latitude": 41.88423, "longitude": -87.62787}, {"latitude": 41.87816, "longitude": -87.62766}, {"latitude": 41.87814, "longitude": -87.63225}, {"latitude": 41.88058, "longitude": -87.63232}, {"latitude": 41.88363, "longitude": -87.6325}, {"latitude": 41.88611, "longitude": -87.63246}, {"latitude": 41.89267, "longitude": -87.63259}, {"latitude": 41.91006, "longitude": -87.63311}, {"latitude": 41.91294, "longitude": -87.63313}, {"latitude": 41.91314, "longitude": -87.63296}, {"latitude": 41.91326, "longitude": -87.63257}, {"latitude": 41.91337, "longitude": -87.6317}, {"latitude": 41.91391, "longitude": -87.63171}, {"latitude": 41.91443, "longitude": -87.63201}, {"latitude": 41.91502, "longitude": -87.63269}, {"latitude": 41.91552, "longitude": -87.63284}, {"latitude": 41.91611, "longitude": -87.63339}, {"latitude": 41.91633, "longitude": -87.63368}, {"latitude": 41.91684, "longitude": -87.63405}, {"latitude": 41.91742, "longitude": -87.63424}, {"latitude": 41.91861, "longitude": -87.63447}, {"latitude": 41.91894, "longitude": -87.63458}, {"latitude": 41.91922, "longitude": -87.63478}, {"latitude": 41.91984, "longitude": -87.63542}, {"latitude": 41.92017, "longitude": -87.63557}, {"latitude": 41.92249, "longitude": -87.63571}, {"latitude": 41.9248, "longitude": -87.63578}, {"latitude": 41.92568, "longitude": -87.63604}, {"latitude": 41.92566, "longitude": -87.63467}, {"latitude": 41.925654, "longitude": -87.633605}, {"latitude": 41.92644, "longitude": -87.63403}, {"latitude": 41.9278, "longitude": -87.63476}, {"latitude": 41.93114, "longitude": -87.63711}, {"latitude": 41.93169, "longitude": -87.63772}, {"latitude": 41.93237, "longitude": -87.63879}, {"latitude": 41.9329, "longitude": -87.63932}, {"latitude": 41.93793, "longitude": -87.63949}, {"latitude": 41.94127, "longitude": -87.63954}, {"latitude": 41.94227, "longitude": -87.63995}, {"latitude": 41.94433, "longitude": -87.64102}, {"latitude": 41.94865, "longitude": -87.64345}, {"latitude": 41.94733, "longitude": -87.64727}, {"latitude": 41.94273, "longitude": -87.64448}, {"latitude": 41.93449, "longitude": -87.64424}, {"latitude": 41.93424, "longitude": -87.64425}, {"latitude": 41.93358, "longitude": -87.64468}, {"latitude": 41.93279, "longitude": -87.6449}, {"latitude": 41.93227, "longitude": -87.6448}, {"latitude": 41.93176, "longitude": -87.64454}, {"latitude": 41.93142, "longitude": -87.6443}, {"latitude": 41.92998, "longitude": -87.64347}, {"latitude": 41.92984, "longitude": -87.64319}, {"latitude": 41.92959, "longitude": -87.64286}, {"latitude": 41.92193, "longitude": -87.63828}, {"latitude": 41.92191, "longitude": -87.63893}, {"latitude": 41.91959, "longitude": -87.63883}, {"latitude": 41.91106, "longitude": -87.63859}, {"latitude": 41.91107, "longitude": -87.63471}, {"latitude": 41.89986, "longitude": -87.63431}, {"latitude": 41.88995, "longitude": -87.63403}, {"latitude": 41.88994, "longitude": -87.63696}, {"latitude": 41.88882, "longitude": -87.63694}, {"latitude": 41.88853, "longitude": -87.63687}, {"latitude": 41.88686, "longitude": -87.63536}, {"latitude": 41.8851, "longitude": -87.63539}, {"latitude": 41.87939, "longitude": -87.63526}, {"latitude": 41.87929, "longitude": -87.6402}, {"latitude": 41.87873, "longitude": -87.67656}, {"latitude": 41.87619, "longitude": -87.67651}, {"latitude": 41.87624, "longitude": -87.67566}, {"latitude": 41.87626, "longitude": -87.67218}, {"latitude": 41.87755, "longitude": -87.67067}, {"latitude": 41.87793, "longitude": -87.64724}, {"latitude": 41.8696, "longitude": -87.64695}, {"latitude": 41.86949, "longitude": -87.65136}, {"latitude": 41.86926, "longitude": -87.66652}, {"latitude": 41.86352, "longitude": -87.66632}, {"latitude": 41.86109, "longitude": -87.66618}, {"latitude": 41.85775, "longitude": -87.66615}, {"latitude": 41.85797, "longitude": -87.65557}, {"latitude": 41.85808, "longitude": -87.64666}, {"latitude": 41.85042, "longitude": -87.64642}, {"latitude": 41.84933, "longitude": -87.64648}, {"latitude": 41.84721, "longitude": -87.64646}, {"latitude": 41.84825, "longitude": -87.64428}, {"latitude": 41.84865, "longitude": -87.64274}, {"latitude": 41.8494, "longitude": -87.64124}, {"latitude": 41.84981, "longitude": -87.6405}, {"latitude": 41.8503, "longitude": -87.6399}, {"latitude": 41.85075, "longitude": -87.63913}, {"latitude": 41.85282, "longitude": -87.63483}, {"latitude": 41.85283, "longitude": -87.63201}, {"latitude": 41.84814, "longitude": -87.63192}, {"latitude": 41.84772, "longitude": -87.63205}, {"latitude": 41.84714, "longitude": -87.63213}, {"latitude": 41.84665, "longitude": -87.63212}, {"latitude": 41.84566, "longitude": -87.63188}, {"latitude": 41.84516, "longitude": -87.63185}, {"latitude": 41.8375, "longitude": -87.63163}, {"latitude": 41.8346, "longitude": -87.6316}, {"latitude": 41.83468, "longitude": -87.62655}, {"latitude": 41.83103, "longitude": -87.62647}, {"latitude": 41.83105, "longitude": -87.62323}, {"latitude": 41.8391, "longitude": -87.62348}, {"latitude": 41.84641, "longitude": -87.6236}, {"latitude": 41.84857, "longitude": -87.62369}, {"latitude": 41.86747, "longitude": -87.62415}, {"latitude": 41.86748, "longitude": -87.6219}, {"latitude": 41.86753, "longitude": -87.62047}, {"latitude": 41.87008, "longitude": -87.62051}];


  var index = 0;
  var lat = chiMarathonCoords[index].latitude;
  var lng = chiMarathonCoords[index].longitude;
  var userPosition = navigator.geolocation.getCurrentPosition(success);
  
  function success(position) {
    var userLat = position.coords.latitude;
    var userLng = position.coords.longitude;
    return (userLat + ", " + userLng);
  }

  var map;
  var marker;
  var lineCoords = [];

  function initMap() {
    var myLatLng = {lat: lat, lng: lng};
    map = new google.maps.Map(document.getElementById('map'), {
      zoom: 12,
      center: myLatLng,
      styles:mapStyles
    });

    var image = '../img/map/marker.png';
    marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      icon : image
    });

    lineCoords.push(new google.maps.LatLng(window.lat, window.lng));
  }

  var redraw = function(payload) {
    lat = payload.message.lat;
    lng = payload.message.lng;
    index = payload.message.index + 1;

    map.setCenter({lat:lat, lng:lng, alt:0});
    marker.setPosition({lat:lat, lng:lng, alt:0});
    lineCoords.push(new google.maps.LatLng(lat, lng));

    var lineCoordinatesPath = new google.maps.Polyline({
      path: lineCoords,
      geodesic: true,
      strokeColor: '#2E10FF'
    });
    
    lineCoordinatesPath.setMap(map);
  };

  var pnChannel = "map-channel";

  var pubnub = new PubNub({
    publishKey: 'pub-c-eb89625d-6646-461c-941e-57e3284d989d',
    subscribeKey: 'sub-c-ef6e78c2-9362-11e7-8ceb-6aa923b6ccec'
  });

  pubnub.subscribe({channels: [pnChannel]});
  pubnub.addListener({message: redraw});

  var publish = function() {
    pubnub.publish({
      channel: pnChannel, 
      message: {index: index, lat: chiMarathonCoords[index].latitude, lng: chiMarathonCoords[index].longitude}
    });
  };

  setInterval(publish, 5000);

  var id = document.getElementById('map');
  if (id) {
    initMap();
  }
});
