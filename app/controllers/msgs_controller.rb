class MsgsController < ApplicationController
	before_action :authenticate_user!
  before_action :get_msgs

  def index
  end

  def create
    msg = current_user.msgs.build(msg_params)
    if msg.save
      current_user.increment!(:score, by = 1)
      ActionCable.server.broadcast 'proom_channel', msg: render_msg(msg)
    end
  end

  def destroy
    if current_user.admin? or current_user.mod?
      @msg = Msg.find(params[:id])
      msg_id = @msg.id
      @msg.destroy

      if @msg.destroy

        ActionCable.server.broadcast 'proom_channel', id: msg_id
      end

    else
      redirect_to chat_path
    end
  end

  private

    def get_msgs
      @msgs = Msg.for_display
      @msg  = current_user.msgs.build
    end

    def msg_params
      params.require(:msg).permit(:content)
    end

    def render_msg(msg)
      render(partial: 'msg', locals: { msg: msg})
    end
end
