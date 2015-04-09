# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("a.remove_fields[data-wrapper-class]").click (e) ->
    e.preventDefault()
    return confirm("Are you sure you want to delete this?")

