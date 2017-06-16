jQuery(document).on 'turbolinks:load', ->
  App.dawnrebirth = App.cable.subscriptions.create {
    channel: "AppearancesChannel"
  },
  connected: ->

  disconnected: ->

  received: (data) ->