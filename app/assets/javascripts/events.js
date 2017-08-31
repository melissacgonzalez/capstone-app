/* global Vue, $ */
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      events: [],
      eventFilter: "",
      sortAttribute: "datetime",
      sortAscending: true
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
        var validName = event.title.toLowerCase().indexOf(this.eventFilter.toLowerCase()) !== -1;
        var validType = event.event_type.toLowerCase().indexOf(this.eventFilter.toLowerCase()) !== -1;
        var validDistance;
        if (event.distance) {
          validDistance = event.distance.toLowerCase().indexOf(this.eventFilter.toLowerCase()) !== -1;
        }
        return validName || validType || validDistance;
      },
      toggleSortOrder: function() {
        this.sortAscending = !this.sortAscending;
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