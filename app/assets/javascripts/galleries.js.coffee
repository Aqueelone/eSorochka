# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('input#gallery_color_id').change ->
  url = '/colors/' + $(this).val + '/gid'
  $.ajax
    type: 'GET'
    dataType: 'json'
    url: url
    success: (data) ->
      $('.color_choose td:last').append '<div class="color_square" style: "background-color:' + data.gid + '"></div'
      return
  return
