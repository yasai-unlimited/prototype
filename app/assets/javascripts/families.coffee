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
  $("#familyPostsView").infinitescroll
    loading: {
      img:     "http://www.mytreedb.com/uploads/mytreedb/loader/ajax_loader_blue_48.gif"
      msgText: "ロード中..."
    }
    navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: "#familyPostsView div.familyPost" # selector for all items you'll retrieve
