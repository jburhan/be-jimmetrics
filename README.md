# Jimmetrics

This is a Rails app used to provide analytics service to track events on websites

client-side JS snippet:
var jimmetrics = {};
  jimmetrics.report = function(eventName){
    var event = {event: { name: eventName }};
    var request = new XMLHttpRequest();
    request.open("POST", "http://localhost:3000/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  };
