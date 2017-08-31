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
        }.bind(this)
      });
    },
    methods: {
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
        return (validTiming ? validName || validType || validDistance : validTiming);
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