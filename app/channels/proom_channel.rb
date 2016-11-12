# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ProomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "proom_channel"
    @count +=1
  end

  def unsubscribed
    @count -=1
  end
end
