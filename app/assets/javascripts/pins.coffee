# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
	$('.chat p img').each ->
		$this = $(this)
		$this.addClass 'fancybox'

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

$(document).on 'ajax:success', 'a.votelink', (status,data,xhr)->
	$(".likes[data-id=#{data.id}]").text data.upvotes
	$(".downvotes[data-id=#{data.id}]").text data.downvotes
	$(".icon-heart[data-id=#{data.id}]").removeClass 'red-icon'
	$(".icon-trash[data-id=#{data.id}]").removeClass 'red-icon'

	if data.liked == true
		$(".icon-heart[data-id=#{data.id}]").addClass 'red-icon'
	else
		$(".icon-trash[data-id=#{data.id}]").addClass 'red-icon'

	return
