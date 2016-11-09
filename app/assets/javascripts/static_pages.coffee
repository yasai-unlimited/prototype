# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#friendGeneralSwitchTabs li').on('click', ->
    friendContents = $('#friendContents')
    generalContents = $('#generalContents')
    friendContents.css('display', 'none')
    generalContents.css('display', 'none')

    if $(this).attr('id')=='friendSelectBtn'
      friendContents.css('display', 'block')
    else if $(this).attr('id')=='generalSelectBtn'
      generalContents.css('display', 'block')
  )