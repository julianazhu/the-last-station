# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  $('#continue_button').focus();

  clearAllShadows = () ->
    clearShadow avatar for avatar in $(".avatar_icon_medium_selectable")

  clearShadow = (avatar) ->
    avatar.src = "/assets/" + avatar.id + ".png"

  showDropShadow = (element) ->
    element.src = "/assets/" + element.id + "_shadow.png"

  setAvatarHiddenField = (element) ->
    $("#character_avatar_image_path")[0].value = element.id + ".png"

  $ ->
    $(".avatar_icon_medium_selectable").click (e) ->
      e.preventDefault()
      clearAllShadows()
      showDropShadow(this)
      setAvatarHiddenField(this)

$(document).ready(ready)
$(document).on('page:load', ready)