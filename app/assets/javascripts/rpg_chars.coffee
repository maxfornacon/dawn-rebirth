$(document).on "turbolinks:load", ->
	$('.char').click ->
		$('.char').removeClass('clicked')
		$(this).toggleClass('clicked')
		$('#charname').val($(this).children('span').text())