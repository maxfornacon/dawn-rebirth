$(document).on "turbolinks:load", ->
  $('.popup-btn').click ->
    $(this).find('.popup-wrap').toggleClass("visible")
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
