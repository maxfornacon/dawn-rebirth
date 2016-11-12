App.proom = App.cable.subscriptions.create "ProomChannel",
	connected: ->
		# Called when the subscription is ready for use on the server

	disconnected: ->
		# Called when the subscription has been terminated by the server

	received: (data) ->
		unless data.msg.blank?
			$('#messages-table').append data.msg
			scroll_bottom()

$(document).on 'turbolinks:load', ->
	submit_msg()
	scroll_bottom()

submit_msg = () ->
	$('#msg_content').on 'keydown', (event) ->
		if event.keyCode is 13
			$('#msg_button').click()
			event.target.value = ""
			event.preventDefault()

scroll_bottom = () ->
	try
		$('#msgs').scrollTop($('#msgs')[0].scrollHeight)
	catch
