# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

hideCurrentFlashcard = (element) ->
  currentFlashcard = element.parentNode
  $(currentFlashcard).toggle()

revealNextFlashcard = (nextFlashcard) ->
  $(nextFlashcard).toggle()

clearAllShadows = () ->
  clearShadow avatar for avatar in $(".avatar_icon_medium")

clearShadow = (avatar) ->
  avatar.src = "/assets/" + avatar.id + ".png"

showDropShadow = (element) ->
  element.src = "/assets/" + element.id + "_shadow.png"

setAvatarHiddenField = (element) ->
  $("#character_avatar_image_path")[0].value = element.id + ".png"

$ ->
  $("a[data-next-flashcard]").click (e) ->
    e.preventDefault()

    nextFlashcard = $(this).data("next-flashcard")
    hideCurrentFlashcard(this)

    revealNextFlashcard(nextFlashcard)

$ ->
  $("[data-select-image]").click (e) ->
    e.preventDefault()
    clearAllShadows()
    showDropShadow(this)
    setAvatarHiddenField(this)
