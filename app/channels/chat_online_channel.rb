class ChatOnlineChannel < ApplicationCable::Channel
  def subscribed
    redis.lpush("online_list", current_user.id)
    stream_from "chat_online_channel"
    ActionCable.server.broadcast "chat_online_channel", user_id: current_user.id, user_name: current_user.name, online: true
  end

  def unsubscribed
    redis.lrem("online_list", 1000 , current_user.id)
    ActionCable.server.broadcast "chat_online_channel", user_id: current_user.id, online: false
  end

  

  private
    def redis
      Redis.new
    end
    
end