# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#season_select_button").click ->
    $("#season_select").toggle()
  $("#season_select > li").click ->
    window.location = $(this).children("a").attr("href")