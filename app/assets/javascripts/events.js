/* global Vue, $, google */
document.addEventListener("DOMContentLoaded", function(event) { 
  if (document.getElementById('app')) {
    var app = new Vue({
      el: '#app',
      data: {
        events: [],
        eventFilter: "",
        sportFilter: "",
        countryFilter: "",
        sortAttribute: "datetime",
        sortAscending: true,
        timing: "upcoming",
        map: ""
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
      watch: {
        validEventsCount: function(events) {
          this.zoomMap(this.map);
        }
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
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            styles:mapStyles,
            scrollwheel: false
          };

          //create a google map instance into the Dom element
          this.map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);
          var map = this.map;
          var data = this.events;
          var bounds = new google.maps.LatLngBounds();

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
          infobox.addListener('domready', function() {
            $('.infobox-close').on('click', function() {
              infobox.close(map, this);
              infobox.isOpen = false;
            });
          });

          var that = this;
          $.each(data, function(i, value) {
            var markerCenter = new google.maps.LatLng(value.latitude, value.longitude);

            var verified = '';

            if (value.verified) {
              verified = '<div class="marker-verified"><i class="fa fa-check"></i></div>';
            }

            var eventStarsFunction = that.stars;

            function getMarkerContent(value) {
              var content = '<div id="marker-' + value.id + '" class="flip-container">' + verified +
              '<div class="flipper">' +
              '<div class="front">' +
              '<img src="' + value.thumbnail + '">' +
              '</div>' +
              '<div class="back">' +
              '<i class="fa fa-eye"></i>' +
              '</div>' +
              '</div>' +
              '</div>';
              return content;
            }

            var markerContent = getMarkerContent(value);
            var marker = new RichMarker({
              id: value.id,
              data: value,
              flat: true,
              position: markerCenter,
              map: map,
              shadow: 0,
              content:markerContent,
              name: value.name
            });
            markers.push(marker);
            data[i].marker = marker;
            var eventStars = eventStarsFunction(value);

            // This event expects a click on a marker
            // When this event is fired the Info Window is opened.
            google.maps.event.addListener(marker, 'click', function() {
              var starsCode;
              if (eventStars !== []) {
                starsCode = '<ul class="list-inline rating">' +
              '<li><i class="' + eventStars[0] + '" aria-hidden="true"' + '></i></li>' +
              '<li><i class="' + eventStars[1] + '" aria-hidden="true"></i></li>' +
              '<li><i class="' + eventStars[2] + '" aria-hidden="true"></i></li>' +
              '<li><i class="' + eventStars[3] + '" aria-hidden="true"></i></li>' +
              '<li><i class="' + eventStars[4] + '" aria-hidden="true"></i></li>' +
              '</ul>';
              }
              var content = '<div class="infobox-close"><i class="fa fa-close"></i></div>' +
              '<div id="iw-container" style="background-image: url(' + marker.data.thumbnail + ');">' +
              '<div class="iw-content">' +
              starsCode +
              '<div class="iw-subTitle">' + marker.data.title + '</div>' +
              '<p>' + marker.data.address + '</p>' +
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
          var validAddress = event.address.toLowerCase().indexOf(this.eventFilter.toLowerCase()) !== -1;
          var validCountry = event.country.toLowerCase().indexOf(this.eventFilter.toLowerCase()) !== -1;
          var validSport;
          if (event.sport) {
            validSport = event.sport.toLowerCase().indexOf(this.eventFilter.toLowerCase()) !== -1;
          }
          var validDistance;
          if (event.distance) {
            validDistance = event.distance.toLowerCase().indexOf(this.eventFilter.toLowerCase()) !== -1;
          }
          var valid = this.isValidCountry(event) && this.isValidSport(event) && (validTiming ? validName || validAddress || validType || validCountry || validSport || validDistance : validTiming);
          if (event.marker) {
            event.marker.setVisible(valid);
          }
          return valid;
        },
        isValidSport: function(event) {
          var validSport;
          if (event.sport) {
            validSport = event.sport.toLowerCase().indexOf(this.sportFilter.toLowerCase()) !== -1;
          }
          return validSport;
        },
        isValidCountry: function(event) {
          var validCountry = event.country.toLowerCase().indexOf(this.countryFilter.toLowerCase()) !== -1;
          return validCountry;
        },
        formatDateTime: function(dateTime) {
          var formattedDateTime = new Date(dateTime).toString();
          return formattedDateTime;
        },
        zoomMap: function(map) {
          var bounds = new google.maps.LatLngBounds();
          this.validEvents.forEach(function(validEvent) {
            bounds.extend(validEvent.marker.getPosition());
          });
          map.fitBounds(bounds);
          map.setCenter(bounds.getCenter());
          google.maps.event.addListenerOnce(map, 'bounds_changed', function(event) {
            if (this.getZoom() > 15) {
              this.setZoom(15);
            }
          });
        },
        stars: function(event) {
          var stars = [];
          var rating;
          if (event.overall_rating > 0) {
            rating = Math.round(event.overall_rating);
          } else if (event.related_rating > 0) {
            rating = Math.round(event.related_rating);
          }
          for (var i = 0; i < rating; i++) {
            stars.push("fa fa-star");
          }
          for (i = 0; i < (5 - rating); i++) {
            stars.push("fa fa-star-o");
          }
          return stars;
        },
        toggleSortOrder: function() {
          this.sortAscending = !this.sortAscending;
        },
        setTiming: function(inputTiming) {
          this.eventFilter = "";
          this.timing = inputTiming;
        },      
      },
      computed: {
        validEvents: function() {
          return this.events.filter(function(event) {
            return this.isValidEvent(event);
          }.bind(this));
        },
        validEventsCount: function() {
          return this.validEvents.length;
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
    
  }
});
