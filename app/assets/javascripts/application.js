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
