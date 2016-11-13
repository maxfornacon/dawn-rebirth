class MsgsController < ApplicationController
	before_action :authenticate_user!
  before_action :get_msgs

  def index
  end

  def create
    msg = current_user.msgs.build(msg_params)
    if msg.save
      ActionCable.server.broadcast 'proom_channel',
                                   msg: render_msg(msg)
    end
  end

  def destroy
    @dmsg = Msg.find(params[:id])
    @dmsg.destroy
    redirect_to :back
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
