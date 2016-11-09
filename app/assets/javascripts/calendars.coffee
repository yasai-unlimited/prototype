# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#calendar').fullCalendar({
    events: [
      {
        title  : '投稿',
        start  : '2016-11-01',
        allDay : true
      },
      {
        title  : 'event2',
        start  : '2016-11-05',
        end    : '2016-11-20'
      },
      {
        title  : 'event3',
        start  : '2016-11-09 12:30:20',
        allDay : false
      }
    ],
    dayClick: (date) ->
      location.href = window.location.href + "/" + date.format("YYYYMMDD")
  })
