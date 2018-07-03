// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
//= require chartkick
//= require Chart.bundle

var jimmetrics = {};
  jimmetrics.report = function(eventName){
    // creates a JSON event object and send it to the Jimmetrics
    var event = {event: { name: eventName }};
    // initializes a new XMLHttpRequest() (AJAX request)
    var request = new XMLHttpRequest();
    // sets the HTTP method to POST, the url of our events endpoint, and allows the request to run asynchronously.
    request.open("POST", "http://localhost:3000/api/events", true);
    // sets the request Content-Type header to 'application/json'. Without that, our API::EventsController would not know to process the request as JSON.
    request.setRequestHeader('Content-Type', 'application/json');
    // sends the request.
    request.send(JSON.stringify(event));
  };
