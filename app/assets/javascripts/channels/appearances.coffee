jQuery(document).on 'turbolinks:load', ->
  App.dawnrebirth = App.cable.subscriptions.create {
    channel: "AppearancesChannel"
  },
  connected: ->

  disconnected: ->

  received: (data) ->
  	user = $(".user-#{data['user_id']}")
  	user.toggleClass 'online', data['online']