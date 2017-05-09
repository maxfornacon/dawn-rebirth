# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
	$('#pins').imagesLoaded ->
		$('#pins').masonry
			itemSelector: '.pin'
			isFitWidth: true
			
	$('.signin-cont').show()
	$('.tabs .tab').click ->
		if $(this).hasClass('signin')
			$('.tabs .tab').removeClass 'active'
			$(this).addClass 'active'
			$('.cont').hide()
			$('.signin-cont').show()
		if $(this).hasClass('signup')
			$('.tabs .tab').removeClass 'active'
			$(this).addClass 'active'
			$('.cont').hide()
			$('.signup-cont').show()
		return