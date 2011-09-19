# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Zoom in/out behaviour
$(document).ready ->
  $('#zoom_in').click -> $('#shoe_photo > img').attr 'class', 'big'
  $("#zoom_out").click -> $('#shoe_photo > img').attr 'class', ''