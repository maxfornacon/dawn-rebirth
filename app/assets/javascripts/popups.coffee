$(document).on "turbolinks:load", ->
  $('.popup-btn').click ->
    $(this).find('.popupwrap').display
