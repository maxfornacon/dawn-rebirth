# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
	$('.petbox').click ->
		$('.petbox').removeClass('clicked')
		$(this).toggleClass('clicked')
		$('#pettype').val( $(this).children('div').attr('class') )
		if $('#pettype').val() == "cat"
			price = 400
			console.log(price)
		else if $('#pettype').val() == "kohle"
			price = 10000
			console.log(price)
		else if $('#pettype').val() == "spider"
			price = 1000
			console.log(price)


		if $('#score').text() < price
			$('#error').text("Das kannst du dir leider nicht leisten!")
			$('.btn').attr("disabled", true)
		else
			$('#error').text("")
			$('.btn').attr("disabled", false)