# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#followBtn').hover(
    ->
      if $('#followBtn').hasClass('unfollow')
        $(this).text("友達解除")
    ->
      if $('#followBtn').hasClass('unfollow')
        $(this).text("友達")
  )
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
#      $('#calendar').find('.fc-content-skeleton').find('td.fc-day').wrapInner('<a></a>')
      url = window.location.href + "/" + date.format("YYYY-MM-DD")
      console.log(url)
#      location.href =
##      d = new Date( date * 1000 )
#      year = date.getYear()
#      month = date.getMonth() + 1
#      date = date.getDate()
#      console.log(year + '-' + month + '-' + date)
  })
#  $('#calendar').find('.fc-content-skeleton').find('td.fc-day').wrapInner('<a></a>')
