/* global Vue, VueCharts, VueRouter, $ */
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = document.getElementById('resultsChart');
  if (app) {
    Vue.use(VueCharts);
    const resultsChart = new Vue({
      el: '#resultsChart',
      data: {
        eventInfo: [],
        results: [], 
        dataLabels: ['Swim', 'T1', 'Bike', 'T2', 'Run', 'Final'],
        params: params
      },
      mounted: function() {
        $.ajax({
          url: '/api/results/' + this.params.id,
          type: 'get',
          success: function(response) {
            this.eventInfo = response;
          }.bind(this)
        });
      },
      methods: {
        swimResults: function(program) {
          console.log(program);
          var swimResults = program.results.map(function(individual) {
            var dateTime = new Date("January 1, 1970 " + individual.splits[0] + "Z");
            return dateTime.getTime();
          });
          console.log(swimResults);
          return swimResults;
        },
        t1Results: function(program) {
          var t1Results = program["results"].map(function(individual) {
            var dateTime = new Date("January 1, 1970 " + individual.splits[1] + "Z");
            return dateTime.getTime();
          });
          return t1Results;
        },
        bikeResults: function(program) {
          var bikeResults = program["results"].map(function(individual) {
            var dateTime = new Date("January 1, 1970 " + individual.splits[2] + "Z");
            return dateTime.getTime();
          });
          return bikeResults;
        },
        t2Results: function(program) {
          var t2Results = program["results"].map(function(individual) {
            var dateTime = new Date("January 1, 1970 " + individual.splits[3] + "Z");
            return dateTime.getTime();
          });
          return t2Results;
        },
        runResults: function(program) {
          var runResults = program["results"].map(function(individual) {
            var dateTime = new Date("January 1, 1970 " + individual.splits[4] + "Z");
            return dateTime.getTime();
          });
          return runResults;
        },
        finalResults: function(program) {
          var finalResults = program["results"].map(function(individual) {
            var dateTime = new Date("January 1, 1970 " + individual.total_time + "Z");
            return dateTime.getTime();
          });
          return finalResults;
        },
        athletes: function(program) {
          var athletes = program["results"].map(function(individual) {
            return individual.athlete_title;
          });
          return athletes;
        },
        fromStringToTime: function(timeString) {
          var dateTime = new Date("January 1, 1970 " + timeString + "Z");
          return dateTime;
        }
      },
      computed: {

      }
    });
  }
});