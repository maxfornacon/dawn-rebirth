# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ProomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "proom_channel"
  end

  def unsubscribed
  end
end
