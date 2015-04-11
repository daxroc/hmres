/**
 *  Logic for Events calendar
 */
 
 // Defer until onLoad
 $(function(){
  var public_holidays = [
      {
        "title": "St. Patricks Day", 
        "start": "2015-03-17", 
        "end": "2015-03-17",
        "rendering": 'background'
      }
    ];
  $("#eventCalendar").fullCalendar({events: public_holidays});
});