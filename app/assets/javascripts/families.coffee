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