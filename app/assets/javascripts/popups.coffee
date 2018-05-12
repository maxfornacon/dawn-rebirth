$(document).on "turbolinks:load", ->
  $('.popup-btn').click ->
    console.log("lol")
    $(this).find('.popup-wrap').css("display", "block")
