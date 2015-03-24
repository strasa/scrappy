# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#modal-1").on "change", ->
    if $(this).is(":checked")
      $("body").addClass "modal-open"
    else
      $("body").removeClass "modal-open"

  $(".modal-window").on "click", ->
    $(".modal-state:checked").prop("checked", false).change()

  $(".modal-inner").on "click", (e) ->
    e.stopPropagation()
