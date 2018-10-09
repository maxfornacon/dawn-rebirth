$(document).on "turbolinks:load", ->
  $('.popup-btn').click ->
    $(this).find('.popup-wrap').toggleClass("visible")
    $(".Dropdown").css("z-index", "-1")
  $('.close-btn').click ->
    eventFire($('.popup-btn'), 'click')

eventFire = (el, etype) ->
  if el.fireEvent
    el.fireEvent 'on' + etype
  else
    evObj = document.createEvent('Events')
    evObj.initEvent etype, true, false
    #el.dispatchEvent evObj
  return
