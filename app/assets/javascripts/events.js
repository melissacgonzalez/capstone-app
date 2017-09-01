/* global Vue, $ */
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      events: [],
      eventFilter: "",
      sortAttribute: "datetime",
      sortAscending: true,
      timing: "upcoming"
    },
    mounted: function() {
      $.ajax({
        url: '/api/events',
        type: 'get',
        success: function(response) {
          this.events = response;
          this.initializeMap();
        }.bind(this)
      });
    },
    methods: {
      initializeMap: function() {
        // Create custom map style here: https://mapstyle.withgoogle.com/
        var mapStyles = [
          {
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

        var mapOptions = {
            center: {lat: 41.8825524, lng: -87.62255140000002},
            zoom: 16,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            styles:mapStyles,
            scrollwheel: false
        };
        //create a google map instance into the Dom element
        var map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);

        /*
        Path to json file that contains listing data for the marker. Make sure you are calling this file through a server.
         */
        // var url = '/api/events';

        // // define the format of the file retrive from server. here it is in JSON format
        // var mapdata = {
        //     format: 'json'
        // };
        // the ajax callback function. Do all the stuff you want to do with the remote data in between this function.
        var data = this.events;
        //loop through each of the single JSON object obtained from the JSON file.
        var markers = [];
        var infobox = new InfoBox({
            content: 'empty',
            disableAutoPan: false,
            maxWidth: 0,
            pixelOffset: new google.maps.Size(-250, -330),
            zIndex: null,
            closeBoxURL: "",
            infoBoxClearance: new google.maps.Size(1, 1),
            isHidden: false,
            isOpen: false,
            pane: "floatPane",
            enableEventPropagation: false
        });
        infobox.addListener('domready', function () {
            $('.infobox-close').on('click', function () {
                infobox.close(map, this);
                infobox.isOpen = false;
            });
        });
        $.each(data, function(i, value) {
            var markerCenter = new google.maps.LatLng(value.latitude, value.longitude);

            var verified = '';


            if (value.verified) {
                verified = '<div class="marker-verified"><i class="fa fa-check"></i></div>';
            }


            function getMarkerContent(value){
                var content='<div id="marker-'+ value.id +'" class="flip-container">'+ verified +
                '<div class="flipper">'+
                '<div class="front">'+
                '<img src="'+value.thumbnail+'">'+
                '</div>'+
                '<div class="back">'+
                '<i class="fa fa-eye"></i>'+
                '</div>'+
                '</div>'+
                '</div>';
                return content;
            }

            var markerContent=getMarkerContent(value);
            var marker = new RichMarker({
                id: value.id,
                data: value,
                flat: true,
                position: markerCenter,
                map: map,
                shadow: 0,
                content:markerContent,
                name: value.name,
                // is_logged_in:value.is_logged_in
            });
            markers.push(marker);
            data[i].marker = marker;

            // This event expects a click on a marker
            // When this event is fired the Info Window is opened.
            google.maps.event.addListener(marker, 'click', function() {

                var content = '<div class="infobox-close"><i class="fa fa-close"></i></div>'+
                '<div id="iw-container" style="background-image: url(' + marker.data.thumbnail + ');">' +
                '<div class="iw-content">' +
                '<ul class="list-inline rating">'+
                '<li><i class="fa fa-star" aria-hidden="true"></i></li>'+
                '<li><i class="fa fa-star" aria-hidden="true"></i></li>'+
                '<li><i class="fa fa-star" aria-hidden="true"></i></li>'+
                '<li><i class="fa fa-star" aria-hidden="true"></i></li>'+
                '<li><i class="fa fa-star" aria-hidden="true"></i></li>'+
                '</ul>'+
                '<div class="iw-subTitle">'+ marker.data.title +'</div>' +
                '<p>' + marker.data.address + '</p>'+
                '</div>' +
                '<div class="iw-bottom-gradient"></div>' +
                '</div>';

                if (!infobox.isOpen) {
                    infobox.setContent(content);
                    infobox.open(map, this);
                    infobox.isOpen = true;
                    infobox.markerId = marker.id;
                } else {
                    if (infobox.markerId == marker.id) {
                        infobox.close(map, this);
                        infobox.isOpen = false;
                    } else {
                        infobox.close(map, this);
                        infobox.isOpen = false;

                        infobox.setContent(content);
                        infobox.open(map, this);
                        infobox.isOpen = true;
                        infobox.markerId = marker.id;
                    }
                }
            });
        });
        console.log(data);
        // call the jquery ajax function
        // $.getJSON(url, mapdata, getContent);
      },
      isValidEvent: function(event) {
        var validTiming;
        if (this.timing === "past") {
          validTiming = (new Date(event.datetime) < new Date());
        } else if (this.timing === "upcoming") {
          validTiming = (new Date(event.datetime) >= new Date());
        } else {
          validTiming = true;
        }
        var validName = event.title.toLowerCase().indexOf(this.eventFilter.toLowerCase()) !== -1;
        var validType = event.event_type.toLowerCase().indexOf(this.eventFilter.toLowerCase()) !== -1;
        var validDistance;
        if (event.distance) {
          validDistance = event.distance.toLowerCase().indexOf(this.eventFilter.toLowerCase()) !== -1;
        }
        var valid = (validTiming ? validName || validType || validDistance : validTiming);
        event.marker.setVisible(valid);
        return valid;
      },
      fullStars: function(event) {
        return parseInt(event.overall_rating);
      },
      openStars: function(event) {
        return 5 - parseInt(event.overall_rating);
      },
      toggleSortOrder: function() {
        this.sortAscending = !this.sortAscending;
      },
      togglePastEvents: function() {
        if (this.timing === "past") {
          this.timing = "upcoming";
        } else {
          this.timing = "past";
        }
      },
      allEvents: function() {
        this.timing = "all";
      }
    },
    computed: {
      validEvents: function() {
        return this.events.filter(function(event) {
          return this.isValidEvent(event);
        }.bind(this));
      },
      modifiedEvents: function() {
        return this.validEvents.sort(function(event1, event2) {
          if (this.sortAscending) {
            return event1[this.sortAttribute].toString().localeCompare(event2[this.sortAttribute].toString());
          } else {
            return -(event1[this.sortAttribute].toString().localeCompare(event2[this.sortAttribute].toString()));
          }          
        }.bind(this));
      }
    }
  });
});