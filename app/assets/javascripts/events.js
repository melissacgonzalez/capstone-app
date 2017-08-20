/* global Vue, $ */
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      events: [],
      eventFilter: "",
      sortAttribute: ""
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
        return validName || validType;
      }

    },
    computed: {
      modifiedEvents: function() {
        return this.events.sort(function(event1, event2) {
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