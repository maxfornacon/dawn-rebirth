$(document).on "turbolinks:load", ->
	$('.Dropdown').on 'click', ->
	  $(this).toggleClass 'is-expanded'
	  return